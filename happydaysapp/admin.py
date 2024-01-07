from django.contrib import admin
from .models import Episodes

class EpisodesAdmin(admin.ModelAdmin):
    change_list_template = 'admin/episodes_change_list.html'
    list_display = ('title', 'series', 'season', 'episode_number', 'airdate')
   
    def changelist_view(self, request, extra_context=None):
        episodes = Episodes.objects.all()
        extra_context = extra_context or {}
        extra_context['episodes'] = episodes
        return super().changelist_view(request, extra_context=extra_context)

# Register the admin class
admin.site.register(Episodes, EpisodesAdmin)


