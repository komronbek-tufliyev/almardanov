from django.db import models
from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _

User = get_user_model()

# Create your models here.

class Quiz(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField(blank=True)

    answer = models.ForeignKey('Answer', on_delete=models.CASCADE, related_name='quizzes')

    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='quizzes')

    def __str__(self):
        return self.title

class Answer(models.Model):
    answer_text = models.CharField(max_length=255)
    is_correct = models.BooleanField(default=False)
    question = models.ForeignKey('Question', on_delete=models.CASCADE, related_name='answers')

    def __str__(self):
        return self.answer_text