from django.shortcuts import HttpResponse
from django.shortcuts import render
from django.views import View
import csv
import numpy as np
import matplotlib.pyplot as plt
import io
import urllib, base64
from datetime import date
from numpy import genfromtxt
from .utils import *

# Create your views here.
def home(request):
    return HttpResponse("Hello Everyone !")
def bethHarmon(request):
    return HttpResponse("Hello Beth Harmon !")
def greet(request,name):
    return HttpResponse(f"Hello, {name.capitalize()}")

class Index(View):
    template = 'index.html'
    def get(self, request):
        return render(request, self.template)

class Calendar(View):
    template = 'calendar.html'
    def get(self, request):
        week_no = int(request.GET.get('week_no'));
        day_of_week = int(request.GET.get('day_of_week'));
        uri = create_prediction_plot(week_no, day_of_week)
        return render(request, self.template,{'data':uri})

