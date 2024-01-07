from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('about/', views.about, name='about'),
    path('search_episodes_by_character/', views.search_episodes_by_character, name='search_episodes_by_character'),
    path('search_coappearances/', views.search_coappearances, name='search_coappearances'),
    path('rank_characters_by_appearances/', views.rank_characters_by_appearances, name='rank_characters_by_appearances'),
    path('rank_character_combinations/', views.rank_character_combinations, name='rank_character_combinations'),
]
