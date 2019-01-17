from rest_framework import serializers

from .models import User

import secrets
import hashlib

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('email', 'name', 'password', 'token',)
        read_only_fields = ('token',)

    def create(self, validated_data):
        user = User(
            email = validated_data['email'],
            name = validated_data['name'],
            password = hashlib.sha256(validated_data['password'].encode("utf-8")).hexdigest(),
            token = secrets.token_hex(16)
        )
        user.save()
        return user
