from django.contrib import admin
from .models import (
    Answer,
    Quiz,
    Question,
    Category,
    UserQuiz,
    UserAnswer,
)


class AnswerAdmin(admin.ModelAdmin):
    list_display = ('id', 'answer', 'question',  'is_correct', )
    list_display_links = ('id', 'answer', 'question','is_correct', )
    list_filter = ('question', 'is_correct', )
    search_fields = ('answer', 'question', 'is_correct', )
    list_per_page = 25

class QuizAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'category', )
    list_display_links = ('id', 'title', 'category', )
    list_filter = ('title', 'category', )
    search_fields = ('title', 'category', )
    list_per_page = 25

class QuestionAdmin(admin.ModelAdmin):
    list_display = ('id', 'quiz', 'title', 'difficulty', 'description', )
    list_display_links = ('id', 'quiz', 'title', 'difficulty', 'description',  )
    list_filter = ('quiz', 'title', 'difficulty', 'description', )
    search_fields = ('quiz', 'title', 'difficulty', 'description',)
    list_per_page = 25

class CategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', )
    list_display_links = ('id', 'name', )
    list_filter = ('name', )
    search_fields = ('name', )
    list_per_page = 25


class UserQuizAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'quiz', 'score',  )
    list_display_links = ('id', 'user', 'quiz', 'score', )
    list_filter = ('user', 'quiz', 'score', )
    search_fields = ('user', 'quiz', 'score',  )
    list_per_page = 25

class UserAnswerAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'answer',  )
    list_display_links = ('id', 'user', 'answer',  )
    list_filter = ('user', 'answer',  )
    search_fields = ('user', 'answer',  )
    list_per_page = 25

admin.site.register(Answer, AnswerAdmin)
admin.site.register(Quiz, QuizAdmin)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(UserQuiz, UserQuizAdmin)
admin.site.register(UserAnswer, UserAnswerAdmin)

