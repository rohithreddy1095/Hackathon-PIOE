from django.urls import path

from .views import *

urlpatterns = [
#path('<str:name>', greet, name='greet'),
path('', Index.as_view(), name='index'),
path('index', Index.as_view(), name='index'),
path('calendar/', Calendar.as_view(), name='calendar')
]