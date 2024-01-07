from django.shortcuts import render
from .models import Episodes, Characters, Scenes, Character_Scene
import logging
from django.db import models
from django.db.models import Count, Q, F, Subquery, OuterRef, Sum, IntegerField
from itertools import combinations as itertools_combinations
import json

logger = logging.getLogger(__name__)

def about(request):
    return render(request, 'happydaysapp/about.html')

def search_episodes_by_character(request):
    try:
        character_name = request.GET.get('character_name')
        characters = Characters.objects.filter(name__icontains=character_name).order_by('name')
        if not characters:
            return render(request, 'happydaysapp/error.html', {'message': 'Character not found.'})
        season_start = request.GET.get('season_start')
        season_end = request.GET.get('season_end')
        start_date = request.GET.get('start_date')
        end_date = request.GET.get('end_date')
        if characters.count() > 1:
            return render(request, 'happydaysapp/multiplecharacters.html', {'characters': characters, 'season_start': season_start, 'season_end': season_end, 'start_date': start_date, 'end_date': end_date})
        else:
            character = characters.first()
            logger.info(f"Found character: {character}")
        
        episodes = Episodes.objects.filter(
            scenes__character_scenes__character=character
        ).distinct()
        
        season_start = request.GET.get('season_start')
        season_end = request.GET.get('season_end')

        if season_start:
            episodes = episodes.filter(season__gte=int(season_start))
        if season_end:
            episodes = episodes.filter(season__lte=int(season_end))

        start_date = request.GET.get('start_date')
        end_date = request.GET.get('end_date')
        if start_date:
            episodes = episodes.filter(airdate__gte=start_date)
        if end_date:
            episodes = episodes.filter(airdate__lte=end_date)

        episodes = episodes.order_by('id')

    except Exception as e:
        logger.exception(f"An unexpected error occurred in search_episodes_by_character: {str(e)}")
        return render(request, 'happydaysapp/error.html', {'message': f'An unexpected error occurred: {str(e)}. Please check the logs for more details.'})
    
    return render(request, 'happydaysapp/bycharacter.html', {'episodes': episodes, 'character_name': character.name})

def search_coappearances(request):
    try:
        char1_name = request.GET.get('character1_name', '')
        char2_name = request.GET.get('character2_name', '')
        
        if not char1_name or not char2_name:
            return render(request, 'happydaysapp/error.html', {'message': 'Both characters are required for search.'})

        char1 = Characters.objects.filter(name__icontains=char1_name).first()
        char2 = Characters.objects.filter(name__icontains=char2_name).first()

        if not char1 or not char2:
            missing_char = char1_name if not char1 else char2_name
            return render(request, 'happydaysapp/error.html', {'message': f'Character {missing_char} not found.'})

        scene_ids_with_char1 = Character_Scene.objects.filter(character=char1).values_list('scene', flat=True)
        scene_ids_with_char2 = Character_Scene.objects.filter(character=char2).values_list('scene', flat=True)

        scenes_with_both_characters = Scenes.objects.filter(
            id__in=scene_ids_with_char1
        ).filter(
            id__in=scene_ids_with_char2
        )

        episode_ids_with_scenes = scenes_with_both_characters.values_list('episode', flat=True).distinct()
        episodes = Episodes.objects.filter(id__in=episode_ids_with_scenes).order_by('id')

        season_start = request.GET.get('season_start')
        season_end = request.GET.get('season_end')
        if season_start:
            episodes = episodes.filter(season__gte=int(season_start))
        if season_end:
            episodes = episodes.filter(season__lte=int(season_end))

        start_date = request.GET.get('start_date')
        end_date = request.GET.get('end_date')
        if start_date:
            episodes = episodes.filter(airdate__gte=start_date)
        if end_date:
            episodes = episodes.filter(airdate__lte=end_date)
            
    except Exception as e:
        return render(request, 'happydaysapp/error.html', {'message': str(e)})

    return render(request, 'happydaysapp/coappearances.html', {'episodes': episodes, 'character1_name': char1.name, 'character2_name': char2.name})

def rank_characters_by_appearances(request):
    try:
        start_date = request.GET.get('start_date')  # New line
        end_date = request.GET.get('end_date')  # New line
        filters = Q(character=OuterRef('pk'))
        if start_date:
            filters &= Q(scene__episode__airdate__gte=start_date)
        if end_date:
            filters &= Q(scene__episode__airdate__lte=end_date)

        sub_query = Character_Scene.objects.filter(
            filters
        ).values('character').annotate(
            cnt=Count('scene__episode__id', distinct=True)
        ).values('cnt')

        characters_data = Characters.objects.annotate(
            num_appearances=Subquery(sub_query, output_field=IntegerField())
        ).order_by('-num_appearances', 'name')

        gender = request.GET.get('gender')
        if gender:
            characters_data = characters_data.filter(gender=gender)

        regular = request.GET.get('regular')
        if regular:
            regular_filters = Q(character=OuterRef('pk'))
            if regular:
                regular_filters &= Q(regular=regular.replace("T", "Y").replace("F", "N"))  # Replace T with Y and F with N

            sub_query = Character_Scene.objects.filter(
                regular_filters
            ).values('character').annotate(
                cnt=Count('scene__episode__id', distinct=True)
            ).values('cnt')

            characters_data = characters_data.annotate(
                num_appearances=Subquery(sub_query, output_field=IntegerField())
            ).filter(num_appearances__gt=0)

        episodes = Episodes.objects.all()

        season_start = request.GET.get('season_start')
        season_end = request.GET.get('season_end')
        if season_start or season_end:
            if season_start:
                episodes = episodes.filter(season__gte=int(season_start))
            if season_end:
                episodes = episodes.filter(season__lte=int(season_end))

            episode_ids_in_range = episodes.values_list('id', flat=True)
            sub_query = sub_query.filter(scene__episode__id__in=episode_ids_in_range)
            characters_data = characters_data.annotate(
                num_appearances=Subquery(sub_query, output_field=IntegerField())
            )

    except Exception as e:
        return render(request, 'happydaysapp/error.html', {'message': str(e)})

    return render(request, 'happydaysapp/charactersranked.html', {'characters': characters_data})

def rank_character_combinations(request):
    try:
        season_start = request.GET.get('season_start')
        season_end = request.GET.get('season_end')
        start_date = request.GET.get('start_date')
        end_date = request.GET.get('end_date')
        gender = request.GET.get('gender')
        regular = request.GET.get('regular')
        
        characters = Characters.objects.all()
        if gender:
            characters = characters.filter(gender=gender)
        is_regular = None
        if regular:
            is_regular = 'Y' if regular == 'T' else 'N'
            characters = characters.filter(
                character_scenes__regular=is_regular
            ).distinct()

        pairs = list(itertools_combinations(characters.values_list('id', 'name').all(), 2))

        data = []

        episodes = Episodes.objects.all()

        if season_start:
            episodes = episodes.filter(season__gte=int(season_start))
        if season_end:
            episodes = episodes.filter(season__lte=int(season_end))

        if start_date:
            episodes = episodes.filter(airdate__gte=start_date)
        if end_date:
            episodes = episodes.filter(airdate__lte=end_date)

        episode_ids_in_range = episodes.values_list('id', flat=True)

        for (c1_id, c1_name), (c2_id, c2_name) in pairs:
            sub_query = Character_Scene.objects.filter(
                Q(scene__episode__id__in=episode_ids_in_range) & 
                Q(character_id=c1_id) |
                Q(scene__episode__id__in=episode_ids_in_range) &
                Q(character_id=c2_id)
            )

            scene_ids_with_c1 = Character_Scene.objects.filter(character_id=c1_id, scene__episode__id__in=episode_ids_in_range).values_list('scene', flat=True)
            scene_ids_with_c2 = Character_Scene.objects.filter(character_id=c2_id, scene__episode__id__in=episode_ids_in_range).values_list('scene', flat=True)

            if is_regular:
                scene_ids_with_c1 = scene_ids_with_c1.filter(regular=is_regular)
                scene_ids_with_c2 = scene_ids_with_c2.filter(regular=is_regular)

            scene_ids_with_c1 = scene_ids_with_c1.values_list('scene', flat=True)
            scene_ids_with_c2 = scene_ids_with_c2.values_list('scene', flat=True)
            condition_q = Q(id__in=scene_ids_with_c1) & Q(id__in=scene_ids_with_c2)
            cnt = Scenes.objects.filter(
                Q(episode__id__in=episode_ids_in_range) & 
                Q(id__in=scene_ids_with_c1) & 
                Q(id__in=scene_ids_with_c2)
            ).values('episode').distinct().count()
    
            data.append({
                'c1_id': c1_id,
                'c1_name': c1_name,
                'c2_id': c2_id,
                'c2_name': c2_name,
                'coappearances': cnt
            })

        sorted_data = sorted(data, key=lambda x: (-x['coappearances'], x['c1_id']))

    except Exception as e:
        return render(request, 'happydaysapp/error.html', {'message': str(e)})

    return render(request, 'happydaysapp/charactercombinations.html', {'combinations': sorted_data, 'current_rank': 0, 'last_coappearances': -1, 'actual_counter': 0})

def home(request):
    return render(request, 'happydaysapp/home.html')
