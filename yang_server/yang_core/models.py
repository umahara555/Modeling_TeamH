from django.db import models
from django.utils import timezone

class User(models.Model):
    email = models.EmailField(max_length=256)
    name = models.CharField(max_length=256)
    password = models.CharField(max_length=256)

    def __str__(self):
        return self.name

class Lecture(models.Model):
    semesters = (('前学期', '前学期'), ('後学期', '後学期'))
    days = (('月','月'),('火','火'),('水','水'),('木','木'),('金','金'),('土','土'),('集中','集中'),('その他','その他'))
    periods = ((1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(6,6),(7,7),(8,8))

    subject = models.CharField(max_length=256)
    teacher = models.CharField(max_length=256)
    semester = models.CharField(max_length=3, choices=semesters,)
    year = models.IntegerField()
    day = models.CharField(max_length=256, choices=days)
    period = models.IntegerField(null=True, choices=periods, blank=True)
    faculty = models.CharField(max_length=256)
    department = models.CharField(max_length=256)
    credit = models.IntegerField()

    def __str__(self):
        return self.subject

class Homework(models.Model):
    lecture_id = models.ForeignKey(Lecture, on_delete=models.PROTECT)
    title = models.CharField(max_length=256, default='')
    abstract = models.CharField(max_length=512, null=True)
    due = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f'{self.lecture_id.subject} : {self.title}'

class UserLecture(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.PROTECT)
    lecture_id = models.ForeignKey(Lecture, on_delete=models.PROTECT)

    def __str__(self):
        return f'{self.user_id.name} : {self.lecture_id.subject}'

class UserHomework(models.Model):
    states = (('未着手','未着手'),('処理中','処理中'),('完了','完了'))

    user_id = models.ForeignKey(User, on_delete=models.PROTECT)
    homework_id = models.ForeignKey(Homework, on_delete=models.PROTECT)
    state = models.CharField(max_length=3, choices=states, default='未着手')

    def __str__(self):
        return f'{self.user_id.name} : {self.homework_id.lecture_id.subject} : {self.homework_id.title}'

class Thread(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    homework_id = models.ForeignKey(Homework, on_delete=models.CASCADE)
    title = models.CharField(max_length=128)
    message = models.CharField(max_length=1024)
    created = models.DateTimeField()

    def __str__(self):
        return self.title

class Reply(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    thread_id = models.ForeignKey(Thread, on_delete=models.CASCADE)
    message = models.CharField(max_length=1024)
    created =  models.DateTimeField()

    def __str__(self):
        return self.thread_id
