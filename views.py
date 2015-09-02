from django.shortcuts import render
from django.template.response import TemplateResponse

# Create your views here.

def main(request):
	return TemplateResponse(request, 'riotface/main.html', {})

# views examples riotJS

def example04(request):
	return TemplateResponse(request, 'riotface/04.html', {})
