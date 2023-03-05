from rest_framework import viewsets
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi
from .models import (
    Category,
    Quiz,
    Question,
    TempUser,
)
from .serializer import (
    CategorySerializer,
    QuizSerializer,
    QuestionSerializer,
    TempUserSerializer,
    DetailQuizSerializer,
    DetailQuestionSerializer,
    DetailTempUserSerializer,
    DetailCategorySerializer,
)
from rest_framework.response import Response
from rest_framework.decorators import action

class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

    @action(detail=True, methods=['get'])
    def quizzes(self, request, pk=None):
        category = self.get_object()
        serializer = DetailCategorySerializer(category)
        return Response(serializer.data)
    
class QuizViewSet(viewsets.ModelViewSet):
    queryset = Quiz.objects.all()
    serializer_class = QuizSerializer

    @action(detail=True, methods=['get'])
    def questions(self, request, pk=None):
        quiz = self.get_object()
        serializer = DetailQuizSerializer(quiz)
        return Response(serializer.data)
    
class QuestionViewSet(viewsets.ModelViewSet):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer

    @action(detail=True, methods=['get'])
    def quiz(self, request, pk=None):
        question = self.get_object()
        serializer = DetailQuestionSerializer(question)
        return Response(serializer.data)
    
class TempUserViewSet(viewsets.ModelViewSet):
    queryset = TempUser.objects.all()
    serializer_class = TempUserSerializer

    @action(detail=True, methods=['get'])
    def quiz(self, request, pk=None):
        temp_user = self.get_object()
        serializer = DetailTempUserSerializer(temp_user)
        return Response(serializer.data)

    @action(detail=True, methods=['get'])
    def questions(self, request, pk=None):
        temp_user = self.get_object()
        serializer = DetailTempUserSerializer(temp_user)
        return Response(serializer.data)


# View to take a quiz. Post the answers to the questions.

from rest_framework.views import APIView

class TakeQuizView(APIView):
    def get(self, request, *args, **kwargs):
        query = Question.objects.all()
        serializer = DetailQuestionSerializer()       # serializer.is_valid()
        return Response(serializer.data)


    @swagger_auto_schema(
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            properties={
                '1': openapi.Schema(type=openapi.TYPE_STRING),
                '2': openapi.Schema(type=openapi.TYPE_STRING),
                '3': openapi.Schema(type=openapi.TYPE_STRING),
                '4': openapi.Schema(type=openapi.TYPE_STRING),
                '5': openapi.Schema(type=openapi.TYPE_STRING),
                '6': openapi.Schema(type=openapi.TYPE_STRING),
                '7': openapi.Schema(type=openapi.TYPE_STRING),
                '8': openapi.Schema(type=openapi.TYPE_STRING),
                '9': openapi.Schema(type=openapi.TYPE_STRING),
                '10': openapi.Schema(type=openapi.TYPE_STRING),
            }
        ),
        responses={200: openapi.Schema(
            type=openapi.TYPE_OBJECT,
            properties={
                'score': openapi.Schema(type=openapi.TYPE_INTEGER),
                'total': openapi.Schema(type=openapi.TYPE_INTEGER),
            }
        )},

    )
    def post(self, request, *args, **kwargs):
        simple_req_body = [
            {
                "question_id": 1,
                "answer": "answer1"
            },
            {
                "question_id": 2,
                "answer": "answer2"
            },

        ]
        answers = request.data.get('answers', None)
        if answers is None:
            return Response({'error': 'No answers provided'}, status=400)
        
        score = 0
        total = 0
        for answer in answers:
            question = Question.objects.get(id=answer['question_id'])
            correct_answer = question.get_correct_answer()
            print(correct_answer, request.data[str(question.id)])
            if correct_answer == answer['answer']:
                score += 1
            total += 1
        # quiz = Quiz.objects.get(id=kwargs['pk'])
        # questions = Question.objects.filter(quiz=quiz)
        # for question in questions:
        #     total += 1
            # correct_answer = question.get_correct_answer()

        return Response({'score': score, 'total': total})
    

