from django.contrib import admin

from .models import Lecture, Homework

admin.site.register(Lecture)
admin.site.register(Homework)
