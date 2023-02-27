from django.urls import path
from .views import (
    QuizViewSet,
    QuestionViewSet,
    CategoryViewSet,
    AnswerViewSet,
    UserAnswerViewSet,
    # UserViewSet,
    UserQuizViewSet,
)
    # QuizQuestionViewSet,

urlpatterns = [
    path('quiz/', QuizViewSet.as_view({'get': 'list', 'post': 'create'})),
    path('quiz/<int:pk>/', QuizViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
    path('question/', QuestionViewSet.as_view({'get': 'list', 'post': 'create'})),
    path('question/<int:pk>/', QuestionViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
    path('category/', CategoryViewSet.as_view({'get': 'list', 'post': 'create'})),
    path('category/<int:pk>/', CategoryViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
    path('answer/', AnswerViewSet.as_view({'get': 'list', 'post': 'create'})),
    path('answer/<int:pk>/', AnswerViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
    path('useranswer/', UserAnswerViewSet.as_view({'get': 'list', 'post': 'create'})),
    path('useranswer/<int:pk>/', UserAnswerViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
    # path('quizes/user/', UserViewSet.as_view({'get': 'list', 'post': 'create'})),
    # path('quizes/user/<int:pk>/', UserViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
    path('userquiz/', UserQuizViewSet.as_view({'get': 'list', 'post': 'create'})),
    path('userquiz/<int:pk>/', UserQuizViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
    # path('quizquestion/', QuizQuestionViewSet.as_view({'get': 'list', 'post': 'create'})),
    # path('quizquestion/<int:pk>/', QuizQuestionViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
]

