from django.contrib import admin

from .models import User, Lecture, Homework, UserLecture, UserHomework, Thread, Reply

admin.site.register(User)
admin.site.register(Lecture)
admin.site.register(Homework)
admin.site.register(UserLecture)
admin.site.register(UserHomework)
admin.site.register(Thread)
admin.site.register(Reply)
