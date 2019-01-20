from rest_framework import serializers

from .models import User

import hashlib

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('email', 'name', 'password',)
        write_only_fields = ('email', 'password',)

    def create(self, validated_data):
        user = User(
            email = validated_data['email'],
            name = validated_data['name'],
            password = hashlib.sha256(validated_data['password'].encode("utf-8")).hexdigest()
        )
        user.save()
        return user
