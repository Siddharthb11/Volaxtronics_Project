from django.urls import path
from . import views

urlpatterns = [
    path('register/', views.register_user),
    path('login/', views.login_user),
    path('logout/', views.user_logout),
    path('profile/', views.profile)
]
