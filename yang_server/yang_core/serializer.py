from rest_framework import serializers

from .models import Lecture, Homework, User, UserHomework

class LectureSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lecture
        fields = ('lecture_name', 'teacher_name',)

class HomeworkSerializer(serializers.ModelSerializer):
    class Meta:
        model = Homework
        fields = ('lecture_id', 'title', 'abstract', 'due_date',)

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('user_name',)

class UserHomeworkSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserHomework
        fields = ('user_id', 'homework_id', 'state',)
