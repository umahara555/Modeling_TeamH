from rest_framework import serializers

from .models import User, Lecture, Homework, UserLecture, UserHomework, Thread, Reply

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

class UserHomeworkSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserHomework
        fields = '__all__'

class ThreadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Thread
        fields = '__all__'

class ReplySerializer(serializers.ModelSerializer):
    class Meta:
        model = Reply
        fields = '__all__'
