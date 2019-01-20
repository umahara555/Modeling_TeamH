from rest_framework import viewsets
from django.shortcuts import get_object_or_404

from .models import User
from .serializer import UserSerializer

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
