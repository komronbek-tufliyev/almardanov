from django.urls import path
from .views import (
    QuizViewSet,
    CategoryViewSet,
    QuestionViewSet,
    TempUserViewSet,
    TakeQuizView,
)

urlpatterns = [
    path('category/', CategoryViewSet.as_view({'get': 'list'})),
    path('category/<int:pk>/', CategoryViewSet.as_view({'get': 'retrieve'})),
    path('category/<int:pk>/quizzes/', CategoryViewSet.as_view({'get': 'quizzes'})),
    path('quiz/', QuizViewSet.as_view({'get': 'list'})),
    path('quiz/<int:pk>/', QuizViewSet.as_view({'get': 'retrieve'})),
    path('quiz/<int:pk>/questions/', QuizViewSet.as_view({'get': 'questions'})),
    path('question/', QuestionViewSet.as_view({'get': 'list'})),
    path('question/<int:pk>/', QuestionViewSet.as_view({'get': 'retrieve'})),
    path('question/<int:pk>/quiz/', QuestionViewSet.as_view({'get': 'quiz'})),
    path('tempuser/', TempUserViewSet.as_view({'get': 'list'})),
    path('tempuser/<int:pk>/', TempUserViewSet.as_view({'get': 'retrieve'})),
    path('tempuser/<int:pk>/quiz/', TempUserViewSet.as_view({'get': 'quiz'})),

    # View to take a quiz. Post the answers to the questions.
    path('takequiz/', TakeQuizView.as_view()),
]
