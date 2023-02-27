from rest_framework import views, status, generics
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated
from django.contrib.auth import login, logout
from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _

from .serializers import (
    UserSerializer,
    LoginSerializer,
    ChangeEmailSerializer,
    ChangePasswordSerializer,
    ChangeUsernameSerializer,
    DeleteUserSerializer,
)


class GetUsersListAPIView(generics.ListAPIView):
    """Get a list of users"""
    serializer_class = UserSerializer
    permission_classes = (IsAuthenticated,)
    queryset = get_user_model().objects.all()

class RetrieveUserAPIView(generics.RetrieveAPIView):
    """Get a user"""
    serializer_class = UserSerializer
    permission_classes = (IsAuthenticated,)
    queryset = get_user_model().objects.all()

class UserCreateAPIView(generics.CreateAPIView):
    """Create a new user in the system"""
    serializer_class = UserSerializer
    permission_classes = (AllowAny,)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "message": "User Created Successfully.  Now perform Login to get your token",
        }, status=status.HTTP_201_CREATED)
    

class UserLoginAPIView(views.APIView):
    """Login API View"""
    serializer_class = LoginSerializer
    permission_classes = (AllowAny,)

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        login(request, user)
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "message": "User Logged In Successfully",
        }, status=status.HTTP_200_OK)
    
class UpdateUserAPIView(generics.UpdateAPIView):
    """Update a user in the system"""
    serializer_class = UserSerializer
    permission_classes = (IsAuthenticated,)
    queryset = get_user_model().objects.all()
    
    def update(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "message": "User Updated Successfully",
        }, status=status.HTTP_200_OK)
    
class UserLogoutAPIView(views.APIView):
    """Logout API View"""
    permission_classes = (IsAuthenticated,)

    def post(self, request, *args, **kwargs):
        logout(request)
        return Response({
            "message": "User Logged Out Successfully",
        }, status=status.HTTP_200_OK)
    
class ChangeEmailAPIView(views.APIView):
    """Change Email API View"""
    serializer_class = ChangeEmailSerializer
    permission_classes = (IsAuthenticated,)

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = request.user
        user.email = serializer.validated_data['email']
        user.save()
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "message": "User Email Updated Successfully",
        }, status=status.HTTP_200_OK)
    
class ChangeUsernameAPIView(views.APIView):
    """Change Username API View"""
    serializer_class = ChangeUsernameSerializer
    permission_classes = (IsAuthenticated,)

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = request.user
        user.username = serializer.validated_data['username']
        user.save()
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "message": "User Username Updated Successfully",
        }, status=status.HTTP_200_OK)
    
class ChangePasswordAPIView(views.APIView):
    """Change Password API View"""
    serializer_class = ChangePasswordSerializer
    permission_classes = (IsAuthenticated,)

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = request.user
        user.set_password(serializer.validated_data['password'])
        user.save()
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "message": "User Password Updated Successfully",
        }, status=status.HTTP_200_OK)
    

class DeleteUserAPIView(views.APIView):
    """Delete User API View"""
    serializer_class = DeleteUserSerializer
    permission_classes = (IsAuthenticated,)

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = request.user
        user.delete()
        return Response({
            "message": "User Deleted Successfully",
        }, status=status.HTTP_200_OK)
    



