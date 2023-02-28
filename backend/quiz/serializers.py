from rest_framework import serializers
from .models import (
    Quiz,
    Category,
    Question,
    Answer
)


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name', ]


class QuizSerializer(serializers.ModelSerializer):
    class Meta:
        model = Quiz
        fields = ['id', 'title', 'category', 'image', 'date_created',]


class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ['id', 'text', 'quiz', 'image', 'date_created',]

class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ['id', 'text', 'question', 'image', 'is_correct', 'date_created',]


class DisplayQuestionSerializer(serializers.ModelSerializer):
    answers = AnswerSerializer(many=True)
    category = serializers.CharField(source='quiz.category.name')

    class Meta:
        model = Question
        fields = '__all__'

class DisplayQuizSerializer(serializers.ModelSerializer):
    questions = DisplayQuestionSerializer(many=True)

    class Meta:
        model = Quiz
        fields = '__all__'

class DisplayQuizesByCategorySerializer(serializers.ModelSerializer):
    quizes = QuizSerializer(many=True)

    class Meta:
        model = Category
        fields = ['id', 'name', 'quizes', 'image', 'date_created',]


