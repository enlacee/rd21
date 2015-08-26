from django.conf.urls import patterns, url, include
import views


urlpatterns = patterns('',
	url(r'^$', views.main, name='riot:main'),
	url(r'^01.html$', views.example01),
	url(r'^02.html$', views.example02),
	url(r'^03.html$', views.example03),
	url(r'^04.html$', views.example04)
)
