from django.conf.urls import patterns, url, include
import views


urlpatterns = patterns('',
	url(r'^$', views.main, name='riot:main'),
	url(r'^04.html$', views.example04)
)
