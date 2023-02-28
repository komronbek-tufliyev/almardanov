from django.contrib import admin

# Register your models here.
from .models import Quiz, Category, Question, Answer

class QuizAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'category', 'date_created')
    list_display_links = ('id', 'title')
    list_filter = ('category',)
    search_fields = ('title', 'category__name')
    list_per_page = 25


class QuestionAdmin(admin.ModelAdmin):

    list_display = ('id', 'text', 'quiz', 'date_created')
    list_display_links = ('id', 'text')
    list_filter = ('quiz',)
    search_fields = ('text', 'quiz__title')
    list_per_page = 25

class CategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'date_created')
    list_display_links = ('id', 'name')
    search_fields = ('name',)
    list_per_page = 25

class AnswerAdmin(admin.ModelAdmin):
    list_display = ('id', 'text', 'question', 'is_correct', 'date_created')
    list_display_links = ('id', 'text')
    list_filter = ('question',)
    search_fields = ('text', 'question__text')
    list_per_page = 25

admin.site.register(Quiz, QuizAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Answer, AnswerAdmin)
