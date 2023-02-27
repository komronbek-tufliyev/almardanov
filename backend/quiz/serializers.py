from .models import (
    Answer, 
    Quiz, 
    Question, 
    Category,
    UserQuiz,
    UserAnswer,
)

from rest_framework import serializers
from django.contrib.auth import get_user_model

User = get_user_model()

# class UserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User 
#         fields = ('username', 'email', 'first_name', 'last_name', 'is_active', 'is_admin', )
#         ref_name = 'User'

class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ('id', 'question', 'answer', 'is_correct', )
        ref_name = 'Answer'


class QuizSerializer(serializers.Serializer):
    answers = AnswerSerializer(many=True)
    quiz = serializers.CharField(max_length=255, required=True)

    def create(self, validated_data):
        answers = validated_data.pop('answers')
        quiz = Quiz.objects.create(**validated_data)
        for answer in answers:
            Answer.objects.create(quiz=quiz, **answer)
        return quiz
    
    def update(self, instance, validated_data):
        answers = validated_data.pop('answers')
        instance.quiz = validated_data.get('quiz', instance.quiz)
        instance.save()
        for answer in answers:
            answer_instance = Answer.objects.get(id=answer.get('id'))
            answer_instance.answer_text = answer.get('answer_text', answer_instance.answer_text)
            answer_instance.is_correct = answer.get('is_correct', answer_instance.is_correct)
            answer_instance.save()
        return instance


class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ('id', 'quiz', 'title', 'difficulty', 'description', )
        ref_name = 'Question'
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('id', 'name', )

class UserQuizSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserQuiz
        fields = ('id', 'user', 'quiz', 'score', )
        ref_name = 'UserQuiz'

class UserAnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserAnswer
        fields = ('id', 'question', 'answer', 'is_correct', )
        ref_name = 'UserAnswer'
        