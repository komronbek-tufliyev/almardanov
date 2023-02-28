from django.db import models

from django.utils.translation import gettext_lazy as _


class Category(models.Model):
    name = models.CharField(max_length=255, verbose_name=_('Name'))
    date_created = models.DateTimeField(auto_now_add=True, verbose_name=_('Date created'))
    date_updated = models.DateTimeField(auto_now=True, verbose_name=_('Date updated'))
    
    class Meta:
        verbose_name = _('Category')
        verbose_name_plural = _('Categories')
        ordering = ('-date_created',)

    def __str__(self):
        return self.name


class Quiz(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='quizes', verbose_name=_('Category'))
    title = models.CharField(max_length=255, verbose_name=_('Title'))
    description = models.TextField(verbose_name=_('Description'), null=True, blank=True)
    date_created = models.DateTimeField(auto_now_add=True, verbose_name=_('Date created'))
    date_updated = models.DateTimeField(auto_now=True, verbose_name=_('Date updated'))
    image = models.ImageField(upload_to='quiz_images/', null=True, blank=True)

    class Meta:
        verbose_name = _('Quiz')
        verbose_name_plural = _('Quizes')
        ordering = ('-date_created',)

    def __str__(self):
        return self.title


class Question(models.Model):
    DIFFICULTY = (
        ('0', _('Beginner')),
        ('1', _('Intermediate')),
        ('2', _('Advanced'))
    )
    quiz = models.ForeignKey(Quiz, on_delete=models.CASCADE, related_name='questions', verbose_name=_('Quiz'))
    text = models.TextField(verbose_name=_('Text'))
    difficulty = models.CharField(choices=DIFFICULTY, max_length=20, verbose_name=_('Difficulty'), default=DIFFICULTY[0][0])
    date_created = models.DateTimeField(auto_now_add=True, verbose_name=_('Date created'))
    date_updated = models.DateTimeField(auto_now=True, verbose_name=_('Date updated'))
    image = models.ImageField(upload_to='question_images/', null=True, blank=True)
    class Meta:
        verbose_name = _('Question')
        verbose_name_plural = _('Questions')
        ordering = ('-date_created',)

    def __str__(self):
        return self.text
    

class Answer(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE, related_name='answers', verbose_name=_('Question'))
    text = models.TextField(verbose_name=_('Text'))
    is_correct = models.BooleanField(default=False, verbose_name=_('Is correct'))
    date_created = models.DateTimeField(auto_now_add=True, verbose_name=_('Date created'))
    date_updated = models.DateTimeField(auto_now=True, verbose_name=_('Date updated'))
    image = models.ImageField(upload_to='answer_images/', null=True, blank=True)

    class Meta:
        verbose_name = _('Answer')
        verbose_name_plural = _('Answers')
        ordering = ('-date_created',)

    def __str__(self):
        return self.text
    


