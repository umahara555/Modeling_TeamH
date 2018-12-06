from rest_framework import serializers

from .models import Lecture, Homework, User, UserHomework, Thread, Reply

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

class ThreadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Thread
        fields = ('user_id', 'homework_id', 'title', 'message', 'created',)

class ReplySerializer(serializers.ModelSerializer):
    class Meta:
        model = Reply
        fields = ('user_id', 'homework_id', 'message', 'created',)
