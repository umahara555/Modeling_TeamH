from rest_framework import serializers

from .models import User

import hashlib

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('email', 'name', 'password',)
        write_only_fields = ('email', 'password',)
