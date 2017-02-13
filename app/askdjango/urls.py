from django.conf.urls import url
from django.contrib import admin
from django.shortcuts import render

def home(request):
    return render(request, 'home.html')

import requests
def image_jpg(request, name):
    binary = requests.get('http://dnmonster:8080/monster/' + name, params={'size':80}).content
    return HttpResponse(binary, content_type='image/jpeg')

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', home),
    url(r'^(?P<name>\w+).jpg$', image_jpg),
]
