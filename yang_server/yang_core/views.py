from rest_framework import viewsets

from .models import Lecture, Homework, User, UserHomework, Thread, Reply
from .serializer import LectureSerializer, HomeworkSerializer, UserSerializer, UserHomeworkSerializer, ThreadSerializer, ReplySerializer

class LectureViewSet(viewsets.ModelViewSet):
    queryset = Lecture.objects.all()
    serializer_class = LectureSerializer

class HomeworkViewSet(viewsets.ModelViewSet):
    queryset = Homework.objects.all()
    serializer_class = HomeworkSerializer

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class UserHomeworkViewSet(viewsets.ModelViewSet):
    queryset = UserHomework.objects.all()
    serializer_class = UserHomeworkSerializer

class ThreadViewSet(viewsets.ModelViewSet):
    queryset = Thread.objects.all()
    serializer_class = ThreadSerializer

class ReplyViewSet(viewsets.ModelViewSet):
    queryset = Reply.objects.all()
    serializer_class = ReplySerializer
