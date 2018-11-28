from django.contrib import admin

from .models import Lecture, Homework, User, UserHomework

admin.site.register(Lecture)
admin.site.register(Homework)
admin.site.register(User)
admin.site.register(UserHomework)
