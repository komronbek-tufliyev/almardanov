from rest_framework import serializers
from .models import (
    Category,
    Quiz,
    Question,
    TempUser,
)

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('id', 'name')

class QuizSerializer(serializers.ModelSerializer):
    class Meta:
        model = Quiz
        fields = ('id', 'name', 'category')

class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ('id', 'quiz', 'text', 'answer1', 'answer2', 'answer3', 'answer4', 'correct_answer')

class TempUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = TempUser
        fields = ('id', 'name', 'username',)


class DetailQuizSerializer(serializers.ModelSerializer):
    questions = QuestionSerializer(many=True, read_only=True)

    class Meta:
        model = Quiz
        fields = ('id', 'name', 'category', 'questions')

class DetailQuestionSerializer(serializers.ModelSerializer):
    quiz = QuizSerializer(read_only=True)

    class Meta:
        model = Question
        fields = ('id', 'quiz', 'text', 'answer1', 'answer2', 'answer3', 'answer4', 'correct_answer')

class DetailTempUserSerializer(serializers.ModelSerializer):
    quiz = QuizSerializer(read_only=True)
    questions = QuestionSerializer(many=True, read_only=True)

    class Meta:
        model = TempUser
        fields = ('id', 'name', 'username', 'quiz', 'questions', )

class DetailCategorySerializer(serializers.ModelSerializer):
    quizzes = QuizSerializer(many=True, read_only=True)

    class Meta:
        model = Category
        fields = ('id', 'name', 'quizzes')

