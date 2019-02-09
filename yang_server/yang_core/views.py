from rest_framework import viewsets
from django.shortcuts import get_object_or_404

from .models import User, Lecture, Homework, UserLecture
from .serializer import UserSerializer, LectureSerializer, HomeworkSerializer, UserLectureSerializer

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class LectureViewSet(viewsets.ModelViewSet):
    queryset = Lecture.objects.all()
    serializer_class = LectureSerializer

class HomeworkViewSet(viewsets.ModelViewSet):
    queryset = Homework.objects.all()
    serializer_class = HomeworkSerializer

class UserHomeworkViewSet(viewsets.ModelViewSet):
    queryset = UserLecture.objects.all()
    serializer_class = UserLectureSerializer
