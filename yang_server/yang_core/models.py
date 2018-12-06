from django.db import models

class Lecture(models.Model):
    lecture_name = models.CharField(max_length=256)
    teacher_name = models.CharField(max_length=256)

    def __str__(self):
        return self.lecture_name

class Homework(models.Model):
    lecture = models.ForeignKey(Lecture, on_delete=models.CASCADE, default=1)
    title =  models.CharField(max_length=128)
    abstract =  models.CharField(max_length=512)
    due_date =  models.DateTimeField()

    def __str__(self):
        return self.title

class User(models.Model):
    user_name = models.CharField(max_length=256)

    def __str__(self):
        return self.user_name

class UserHomework(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    homework = models.ForeignKey(Homework, on_delete=models.CASCADE, default=1)
    state = models.BooleanField()

class Thread(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    homework = models.ForeignKey(Homework, on_delete=models.CASCADE, default=1)
    title = models.CharField(max_length=128)
    message = models.CharField(max_length=512)
    created = models.DateTimeField()

    def __str__(self):
        return self.title

class Reply(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    thread = models.ForeignKey(Thread, on_delete=models.CASCADE, default=1)
    message = models.CharField(max_length=512)
    created =  models.DateTimeField()

    def __str__(self):
        return self.thread_id
