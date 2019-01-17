from django.db import models

class User(models.Model):
    email = models.EmailField(max_length=256)
    name = models.CharField(max_length=256)
    password = models.CharField(max_length=256)
    token = models.CharField(max_length=256)

    def __str__(self):
        return self.name
