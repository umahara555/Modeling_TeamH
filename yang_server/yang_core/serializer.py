from rest_framework import serializers

from .models import User

import hashlib

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'email', 'name', 'password',)
        extra_kwargs = {'email': {'write_only': True},
                        'password': {'write_only': True},}
