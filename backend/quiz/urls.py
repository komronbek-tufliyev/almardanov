from django.urls import path
from .views import (
    QuizListView,
    QuizDetailView,
    QuestionListView,
    QuestionDetailView,
    AnswerListView,
    GetQuiz,
    GetQuizes,
    GetCategories,
    GetQuestions,
    ShowResult,
    GetQuizByCategory,
    GetAnswersByQuestion,
    GetQuizesByCategory,
)


urlpatterns = [
    # Category urls
    path('categories/', GetCategories.as_view(), name='category-list'),
    
    # Quiz urls
    path('quizes/', GetQuizes.as_view(), name='quizes'),
    path('quizes/list/', QuizListView.as_view()),
    path('quizes/<int:pk>/detail/', QuizDetailView.as_view()),
    path('quizes/<int:pk>/', GetQuiz.as_view()),

    path('categories/<int:pk>/quizes/', GetQuizesByCategory.as_view(), name='quiz-list'),

    # Question urls
    path('questions/', GetQuestions.as_view()),
    path('questions/list/', QuestionListView.as_view()),
    path('questions/<int:pk>/', QuestionDetailView.as_view()),

    # Answer urls
    path('answers/', AnswerListView.as_view()),

    # Result urls
    path('answers/showresult/', ShowResult.as_view()),
]



