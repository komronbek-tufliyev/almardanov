from .models import Answer, Quiz, Question, Category
from rest_framework import serializers
from django.contrib.auth import get_user_model

User = get_user_model()

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User 
        fields = ('username', 'email', 'first_name', 'last_name', 'is_active', 'is_admin', )


class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ('id', 'quiz', 'answer_text', 'is_correct', )



class QuizSerializer(serializers.Serializer):
    answers = AnswerSerializer(many=True)
    quiz = serializers.CharField(max_length=255, required=True)

    def create(self, validated_data):
        user = self.context['user']
        if user is not None:
            if user.is_admin:
                ansers = validated_data.get('ansers', None)
                

