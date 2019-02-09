from rest_framework import serializers

from .models import User, Lecture, Homework, UserLecture

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

class HomeworkSerializer(serializers.ModelSerializer):
    class Meta:
        model = Homework
        fields = '__all__'

class UserLectureSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserLecture
        fields = '__all__'
