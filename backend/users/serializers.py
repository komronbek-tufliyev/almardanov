from rest_framework import serializers
from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _

from django.contrib.auth import authenticate, logout

User = get_user_model()

class UserSerializer(serializers.ModelSerializer):
    """Serializer for the users object"""

    class Meta:
        model = User
        fields = ('email', 'password', 'name')
        extra_kwargs = {'password': {'write_only': True, 'min_length': 5}}

    def create(self, validated_data):
        """Create a new user with encrypted password and return it"""
        return User.objects.create_user(**validated_data)

    def update(self, instance, validated_data):
        """Update a user, setting the password correctly and return it"""
        password = validated_data.pop('password', None)
        user = super().update(instance, validated_data)

        if password:
            user.set_password(password)
            user.save()

        return user
    

class LoginSerializer(serializers.Serializer):
    email = serializers.CharField()
    password = serializers.CharField(
        style={'input_type': 'password'},
        trim_whitespace=False
    )

    def validate(self, attrs):
        email = attrs.get('email')
        password = attrs.get('password')

        if email and password:
            user = authenticate(request=self.context.get('request'),
                                username=email, password=password)
            if not user:
                msg = _('Unable to log in with provided credentials.')
                raise serializers.ValidationError(msg, code='authorization')
        else:
            msg = _('Must include "email" and "password".')
            raise serializers.ValidationError(msg, code='authorization')

        attrs['user'] = user
        return attrs
    
    
class DeleteUserSerializer(serializers.Serializer):
    def validate(self, attrs):
        user = self.context.get('request').user
        user.delete()
        return attrs
    

class ChangePasswordSerializer(serializers.Serializer):
    """
    Serializer for password change endpoint.
    """
    old_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True)

    def validate(self, attrs):
        user = self.context.get('request').user
        if not user.check_password(attrs.get('old_password')):
            raise serializers.ValidationError({"old_password": ["Wrong password."]})
        return attrs

    def save(self, **kwargs):
        user = self.context.get('request').user
        user.set_password(self.validated_data.get('new_password'))
        user.save()
        return user
    
class ChangeEmailSerializer(serializers.Serializer):
    """
    Serializer for email change endpoint.
    """
    password = serializers.CharField(required=True)
    new_email = serializers.EmailField(required=True)

    def validate(self, attrs):
        user = self.context.get('request').user
        if not user.check_password(attrs.get('password')):
            raise serializers.ValidationError({"password": ["Wrong password."]})
        return attrs

    def save(self, **kwargs):
        user = self.context.get('request').user
        user.email = self.validated_data.get('new_email')
        user.save()
        return user

class ChangeUsernameSerializer(serializers.Serializer):
    """
    Serializer for username change endpoint.
    """
    password = serializers.CharField(required=True)
    new_username = serializers.CharField(required=True)

    def validate(self, attrs):
        user = self.context.get('request').user
        if not user.check_password(attrs.get('password')):
            raise serializers.ValidationError({"password": ["Wrong password."]})
        return attrs

    def save(self, **kwargs):
        user = self.context.get('request').user
        user.username = self.validated_data.get('new_username')
        user.save()
        return user


