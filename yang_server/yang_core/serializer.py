from rest_framework import serializers

from .models import Lecture, Homework

class LectureSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lecture
        fields = ('lecture_name', 'teacher_name',)

class HomeworkSerializer(serializers.ModelSerializer):
    class Meta:
        model = Homework
        fields = ('lecture', 'title', 'due_date',)
