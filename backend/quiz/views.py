from rest_framework import views, status, generics
from rest_framework.response import Response
from django.shortcuts import get_object_or_404

from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi

from rest_framework import pagination

from .models import Quiz, Category, Question, Answer
from .serializers import (
    QuizSerializer,
    CategorySerializer,
    QuestionSerializer,
    AnswerSerializer,
    DisplayQuizSerializer,
    DisplayQuestionSerializer,
    DisplayQuizesByCategorySerializer,
)


class MyPagination(pagination.PageNumberPagination):
    page_size = 10
    page_size_query_param = 'page_size'
    max_page_size = 1000
    page_query_param = 'page'



class QuizListView(generics.ListAPIView):
    queryset = Quiz.objects.all()
    serializer_class = QuizSerializer
    pagination_class = MyPagination


class QuizDetailView(generics.RetrieveAPIView):
    queryset = Quiz.objects.all()
    serializer_class = QuizSerializer


class QuestionListView(generics.ListAPIView):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer

class QuestionDetailView(generics.RetrieveAPIView):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer


class AnswerListView(generics.ListAPIView):
    queryset = Answer.objects.all()
    serializer_class = AnswerSerializer


class GetQuiz(views.APIView):
    def get(self, request, *args, **kwargs):
        quiz = Quiz.objects.get(id=kwargs['pk'])
        serializer = DisplayQuizSerializer(quiz)
        return Response(serializer.data)
    
class GetQuizes(views.APIView):
    def get(self, request, *args, **kwargs):
        quizes = Quiz.objects.all()
        serializer = QuizSerializer(quizes, many=True)
        return Response(serializer.data)
    
class GetCategories(views.APIView):
    def get(self, request, *args, **kwargs):
        categories = Category.objects.all()
        serializer = CategorySerializer(categories, many=True)
        return Response(serializer.data)
    
class GetQuestions(generics.ListAPIView):
    pagination_class = MyPagination
    queryset = Question.objects.all()
    serializer_class = DisplayQuestionSerializer


    # def get(self, request, *args, **kwargs):
    #     questions = Question.objects.all()
    #     serializer = DisplayQuestionSerializer(questions, many=True)
    #     return Response(serializer.data)
    
class GetAnswers(views.APIView):
    def get(self, request, *args, **kwargs):
        answers = Answer.objects.all()
        serializer = AnswerSerializer(answers, many=True)
        return Response(serializer.data)
    
class GetQuestionsByQuiz(views.APIView):
    def get(self, request, *args, **kwargs):
        questions = Question.objects.filter(quiz=kwargs['pk'])
        serializer = DisplayQuestionSerializer(questions, many=True)
        return Response(serializer.data)
    
class GetAnswersByQuestion(views.APIView):
    def get(self, request, *args, **kwargs):
        answers = Answer.objects.filter(question=kwargs['pk'])
        serializer = AnswerSerializer(answers, many=True)
        return Response(serializer.data)
    
class GetQuizByCategory(views.APIView):
    def get(self, request, *args, **kwargs):
        quizes = Quiz.objects.filter(category=kwargs['pk'])
        serializer = QuizSerializer(quizes, many=True)
        return Response(serializer.data)
    

class GetPostedAnswers(views.APIView):
    def post(self, request, *args, **kwargs):
        answers = request.data['answers']
        correct_answers = 0
        for answer in answers:
            if Answer.objects.get(id=answer['id']).is_correct:
                correct_answers += 1
        return Response({'correct_answers': correct_answers})
    

class ShowResult(views.APIView):

    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
        self.result = 0
        self.total = 0


    @swagger_auto_schema(request_body=openapi.Schema(
        type=openapi.TYPE_OBJECT,
        properties={
            'answers': openapi.Schema(type=openapi.TYPE_ARRAY, 
                items=openapi.Items(type=openapi.TYPE_OBJECT, 
                properties={
                    'id': openapi.Schema(
                        type=openapi.TYPE_INTEGER, description='Answer id'
                        ),
                        }
                    )
                )
            }
        ),
        operation_summary='Show result of quiz',
        responses={
            200: openapi.Response(
                description='Result of quiz',
                schema=openapi.Schema(
                    type=openapi.TYPE_OBJECT,
                    properties={
                        'result': openapi.Schema(
                            type=openapi.TYPE_INTEGER, description='Correct answers'
                            ),
                        'total': openapi.Schema(
                            type=openapi.TYPE_INTEGER, description='Total questions'
                            ),
                        }
                    )
            ),
            400: openapi.Response(
                description='Bad request. Did you provide `answers`. `answers` must be a list of answer ids',
                examples={
                    'error': 'Did you provide `answers` '
                }
            ),
            500: openapi.Response(
                description='Internal server error',
                examples={
                    'error': 'Something went wrong. Did you provide `answers` '
                }
            )
        }
    )
    def post(self, request, *args, **kwargs):
        try:
            answers = request.data.get('answers', None)
            if not answers:
                return Response({'error': 'Did you provide `answers` '}, status=status.HTTP_400_BAD_REQUEST)
            print(answers)
            if not isinstance(answers, list):
                return Response({'error': '`answers` must be a list of answer ids'}, status=status.HTTP_400_BAD_REQUEST)
            for answer in answers:
                answer_obj = get_object_or_404(Answer, id=answer['id'])
                if answer_obj.is_correct:
                    self.result += 1
                self.total += 1
            return Response({'result': self.result, 'total': self.total})
        except Exception as e:
            print(e)
            return Response({'error': 'Something went wrong. Did you provide `answers` '}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            
    
class GetQuizesByCategory(views.APIView):
    def get(self, request, *args, **kwargs):
        try:
            category = get_object_or_404(Category, pk=kwargs['pk'])
            serializer = DisplayQuizesByCategorySerializer(category, many=False)
            return Response(serializer.data)
        except:
            return Response({'error': 'Category does not exist'}, status=status.HTTP_404_NOT_FOUND)
        

