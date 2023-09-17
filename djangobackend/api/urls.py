
from django.urls import path
from api import views

urlpatterns = [
    path('student/',views.StudnetList.as_view())
]
