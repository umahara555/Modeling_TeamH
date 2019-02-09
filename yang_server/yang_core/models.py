from django.db import models

class User(models.Model):
    email = models.EmailField(max_length=256)
    name = models.CharField(max_length=256)
    password = models.CharField(max_length=256)

    def __str__(self):
        return self.name

class Lecture(models.Model):
    subject = models.CharField(max_length=256)
    teacher = models.CharField(max_length=256)
    semester = models.CharField(max_length=256)
    year = models.IntegerField()
    day = models.CharField(max_length=256)
    period = models.IntegerField()
    faculty = models.CharField(max_length=256)
    department = models.CharField(max_length=256)
    credit = models.IntegerField()

    def __str__(self):
        return self.subject
