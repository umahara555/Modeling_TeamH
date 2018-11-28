from django.db import models

class Lecture(models.Model):
    lecture_name = models.CharField(max_length=256)
    teacher_name = models.CharField(max_length=256)

    def __str__(self):
        return self.lecture_name

class Homework(models.Model):
    lecture = models.ForeignKey(Lecture, on_delete=models.CASCADE, default=1)
    title =  models.CharField(max_length=256)
    abstract =  models.CharField(max_length=512)
    due_date =  models.DateTimeField('date published')

    def __str__(self):
        return self.title

class User(models.Model):
    user_name = models.CharField(max_length=256)

    def __str__(self):
        return self.user_name
