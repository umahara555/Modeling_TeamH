from rest_framework import viewsets
from django.shortcuts import get_object_or_404

from .models import User, Lecture
from .serializer import UserSerializer, LectureSerializer

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class LectureViewSet(viewsets.ModelViewSet):
    queryset = Lecture.objects.all()
    serializer_class = LectureSerializer
