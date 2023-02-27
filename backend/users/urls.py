from django.urls import path
from .views import (
    UserCreateAPIView,
    UserLoginAPIView,
    UpdateUserAPIView,
    UserLogoutAPIView,
    ChangeEmailAPIView,
    DeleteUserAPIView,
    ChangeUsernameAPIView,
    ChangePasswordAPIView,
    GetUsersListAPIView,
    RetrieveUserAPIView,
)


urlpatterns = [
    path('', GetUsersListAPIView.as_view(), name='users'),
    path('<int:pk>/', RetrieveUserAPIView.as_view(), name='user'),
    path('register/', UserCreateAPIView.as_view(), name='register'),
    path('login/', UserLoginAPIView.as_view(), name='login'),
    path('update/', UpdateUserAPIView.as_view(), name='update'),
    path('logout/', UserLogoutAPIView.as_view(), name='logout'),
    path('change-email/', ChangeEmailAPIView.as_view(), name='change-email'),
    path('delete/', DeleteUserAPIView.as_view(), name='delete'),
    path('change-username/', ChangeUsernameAPIView.as_view(), name='change-username'),
    path('change-password/', ChangePasswordAPIView.as_view(), name='change-password'),
]