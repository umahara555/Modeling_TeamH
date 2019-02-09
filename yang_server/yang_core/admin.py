from django.contrib import admin

from .models import User, Lecture, Homework, UserLecture

admin.site.register(User)
admin.site.register(Lecture)
admin.site.register(Homework)
admin.site.register(UserLecture)
