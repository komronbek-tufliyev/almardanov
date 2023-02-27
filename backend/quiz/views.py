from rest_framework import views, status, permissions, generics, viewsets

from rest_framework.response import Response

from django.contrib.auth import get_user_model

from django.utils.translation import gettext_lazy as _

from django.shortcuts import get_object_or_404
from django.db.models import Q

User = get_user_model()

from .models import (
    Answer,
    Quiz,
    Question,
    Category,
    UserQuiz,
    UserAnswer,
)

from .serializers import (
    AnswerSerializer,
    QuizSerializer,
    QuestionSerializer,
    CategorySerializer,
    UserAnswerSerializer,
    UserQuizSerializer,
)

from users.serializers import UserSerializer


class QuizViewSet(viewsets.ModelViewSet):
    queryset = Quiz.objects.all()
    serializer_class = QuizSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        queryset = self.queryset
        query = self.request.query_params.get('query', None)
        if query is not None:
            queryset = queryset.filter(
                Q(quiz__icontains=query)
            )
        return queryset

    def perform_create(self, serializer):
        serializer.save()

    def perform_update(self, serializer):
        serializer.save()

    def perform_destroy(self, instance):
        instance.delete()

    def get_serializer_context(self):
        context = super(QuizViewSet, self).get_serializer_context()
        context.update({'request': self.request})
        return context
    
class QuestionViewSet(viewsets.ModelViewSet):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        queryset = self.queryset
        query = self.request.query_params.get('query', None)
        if query is not None:
            queryset = queryset.filter(
                Q(title__icontains=query) |
                Q(description__icontains=query)
            )
        return queryset

    def perform_create(self, serializer):
        serializer.save()

    def perform_update(self, serializer):
        serializer.save()

    def perform_destroy(self, instance):
        instance.delete()

    def get_serializer_context(self):
        context = super(QuestionViewSet, self).get_serializer_context()
        context.update({'request': self.request})
        return context
    
class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        queryset = self.queryset
        query = self.request.query_params.get('query', None)
        if query is not None:
            queryset = queryset.filter(
                Q(name__icontains=query)
            )
        return queryset

    def perform_create(self, serializer):
        serializer.save()

    def perform_update(self, serializer):
        serializer.save()

    def perform_destroy(self, instance):
        instance.delete()

    def get_serializer_context(self):
        context = super(CategoryViewSet, self).get_serializer_context()
        context.update({'request': self.request})
        return context
    
class UserQuizViewSet(viewsets.ModelViewSet):
    queryset = UserQuiz.objects.all()
    serializer_class = UserQuizSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        queryset = self.queryset
        query = self.request.query_params.get('query', None)
        if query is not None:
            queryset = queryset.filter(
                Q(user__username__icontains=query) |
                Q(quiz__quiz__icontains=query)
            )
        return queryset

    def perform_create(self, serializer):
        serializer.save()

    def perform_update(self, serializer):
        serializer.save()

    def perform_destroy(self, instance):
        instance.delete()

    def get_serializer_context(self):
        context = super(UserQuizViewSet, self).get_serializer_context()
        context.update({'request': self.request})
        return context
    
class UserAnswerViewSet(viewsets.ModelViewSet):
    queryset = UserAnswer.objects.all()
    serializer_class = UserAnswerSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        queryset = self.queryset
        query = self.request.query_params.get('query', None)
        if query is not None:
            queryset = queryset.filter(
                Q(user__username__icontains=query) |
                Q(question__title__icontains=query)
            )
        return queryset

    def perform_create(self, serializer):
        serializer.save()

    def perform_update(self, serializer):
        serializer.save()

    def perform_destroy(self, instance):
        instance.delete()

    def get_serializer_context(self):
        context = super(UserAnswerViewSet, self).get_serializer_context()
        context.update({'request': self.request})
        return context
    
class AnswerViewSet(viewsets.ModelViewSet):
    queryset = Answer.objects.all()
    serializer_class = AnswerSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        queryset = self.queryset
        query = self.request.query_params.get('query', None)
        if query is not None:
            queryset = queryset.filter(
                Q(answer__icontains=query)
            )
        return queryset

    def perform_create(self, serializer):
        serializer.save()

    def perform_update(self, serializer):
        serializer.save()

    def perform_destroy(self, instance):
        instance.delete()

    def get_serializer_context(self):
        context = super(AnswerViewSet, self).get_serializer_context()
        context.update({'request': self.request})
        return context
    
# class UserViewSet(viewsets.ModelViewSet):
#     queryset = User.objects.all()
#     serializer_class = UserSerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):
#         queryset = self.queryset
#         query = self.request.query_params.get('query', None)
#         if query is not None:
#             queryset = queryset.filter(
#                 Q(username__icontains=query) |
#                 Q(email__icontains=query)
#             )
#         return queryset

#     def perform_create(self, serializer):
#         serializer.save()

#     def perform_update(self, serializer):
#         serializer.save()

#     def perform_destroy(self, instance):
#         instance.delete()

#     def get_serializer_context(self):
#         context = super(UserViewSet, self).get_serializer_context()
#         context.update({'request': self.request})
#         return context
 

