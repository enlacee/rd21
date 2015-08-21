from django.shortcuts import render
from django.template.response import TemplateResponse

# Create your views here.

def main(request):
	return TemplateResponse(request, 'riotface/main.html', {})

# views examples riotJS
def example01(request):
	return TemplateResponse(request, 'riotface/01.html', {})

def example02(request):
	return TemplateResponse(request, 'riotface/02.html', {})

def example03(request):
	return TemplateResponse(request, 'riotface/03.html', {})
