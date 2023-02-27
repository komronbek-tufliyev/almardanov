from django.db import models
from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _

User = get_user_model()

# Create your models here.

class Category(models.Model):
    name = models.CharField(max_length=255, verbose_name=_('Name'))
    
    def __str__(self) -> str:
        return self.name


class Quiz(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name=_('User'))
    category = models.ForeignKey(Category, on_delete=models.DO_NOTHING, default=1, related_name='quizzes', verbose_name=_('Category'))
    title = models.CharField(max_length=255, verbose_name=_('Title'), help_text=_('Title'), null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True, verbose_name=_('Date Created'))
    date_updated = models.DateTimeField(auto_now=True, verbose_name=_('Date Updated'))
    
    
    def __str__(self) -> str:
        return self.title
    
    class Meta:
        verbose_name = _('Quiz')
        verbose_name_plural = _('Quizes')
        ordering = ['id']
        
class Question(models.Model):
    DIFFICULTY = (
        ('0', _('Beginner')),
        ('1', _('Intermediate')),
        ('2', _('Advanced'))
    )   
    
    quiz = models.ForeignKey(Quiz, on_delete=models.DO_NOTHING, verbose_name=_('Quiz'))
    title = models.CharField(max_length=255, verbose_name=_('Title'))
    difficulty = models.CharField(choices=DIFFICULTY, max_length=20, verbose_name=_('Difficulty'), default=DIFFICULTY[1][1])
    description = models.TextField(null=True, blank=True)
    
    date_created = models.DateTimeField(auto_now_add=True, verbose_name=_('Date Created'))
    date_updated = models.DateTimeField(auto_now=True, verbose_name=_('Date Updated'))
    
    
    def __str__(self) -> str:
        return self.title
    
    class Meta:
        verbose_name = _('Question')
        verbose_name_plural = _('Questions')
        ordering = ['id']
    
class Answer(models.Model):
    answer = models.CharField(verbose_name=_('Answer'), max_length=150)
    question = models.ForeignKey(Question, on_delete=models.CASCADE, verbose_name=_('Question'), related_name='answers', null=True)
    is_correct = models.BooleanField(default=False)
    
    def __str__(self) -> str:
        return self.answer
    
    class Meta:
        verbose_name = _('Answer')
        verbose_name_plural = _('Answers')
        ordering = ['id']
        
class UserAnswer(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name=_('User'))
    question = models.ForeignKey(Question, on_delete=models.CASCADE, verbose_name=_('Question'))
    answer = models.ForeignKey(Answer, on_delete=models.CASCADE, verbose_name=_('Answer'))
    is_correct = models.BooleanField(default=False)
    
    def __str__(self) -> str:
        return self.answer
    
    class Meta:
        verbose_name = _('User Answer')
        verbose_name_plural = _('User Answers')
        ordering = ['id']

        
class UserQuiz(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name=_('User'))
    quiz = models.ForeignKey(Quiz, on_delete=models.CASCADE, verbose_name=_('Quiz'))
    score = models.IntegerField(default=0, verbose_name=_('Score'))
    
    def __str__(self) -> str:
        return self.quiz.title
    
    class Meta:
        verbose_name = _('User Quiz')
        verbose_name_plural = _('User Quizes')
        ordering = ['id']