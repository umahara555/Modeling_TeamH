from rest_framework import serializers

from .models import User, Lecture

import hashlib

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'email', 'name', 'password',)
        extra_kwargs = {'email': {'write_only': True},
                        'password': {'write_only': True},}

class LectureSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lecture
        fields = ('id', 'subject', 'teacher', 'semester', 'year', 'day', 'period', 'faculty', 'department', 'credit',)
