from django.contrib import admin

from .models import Lecture, Homework, User, UserHomework, Thread, Reply

admin.site.register(Lecture)
admin.site.register(Homework)
admin.site.register(User)
admin.site.register(UserHomework)
admin.site.register(Thread)
admin.site.register(Reply)
