from django.db import models

class Episodes(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    series = models.CharField(max_length=255)
    season = models.IntegerField()
    episode_number = models.IntegerField()
    airdate = models.DateField()

    class Meta:
        db_table = 'episodes'

    def __str__(self):
        return self.title

class Characters(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    gender = models.CharField(max_length=1, choices=[('M', 'Male'), ('F', 'Female')])

    class Meta:
        db_table = 'characters'

    def __str__(self):
        return self.name

class Scenes(models.Model):
    id = models.AutoField(primary_key=True)
    episode = models.ForeignKey(Episodes, related_name='scenes', on_delete=models.CASCADE)

    class Meta:
        db_table = 'scenes'

    def __str__(self):
        return str(self.id)

class Character_Scene(models.Model):
    id = models.AutoField(primary_key=True)
    scene = models.ForeignKey(Scenes, related_name='character_scenes', on_delete=models.CASCADE)
    character = models.ForeignKey(Characters, related_name='character_scenes', on_delete=models.CASCADE)
    REGULAR_CHOICES = [
        ('Y', 'Yes'),
        ('N', 'No'),
    ]
    regular = models.CharField(max_length=1, choices=REGULAR_CHOICES)

    class Meta:
        db_table = 'character_scene'

    def __str__(self):
        return f"{self.scene.id} - {self.character.name}"
