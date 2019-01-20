from rest_framework import viewsets
from django.shortcuts import get_object_or_404

from .models import User
from .serializer import UserSerializer

from rest_framework.response import Response

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
