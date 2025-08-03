# myproject/urls.py
from django.contrib import admin
from django.urls import path, include # Tambahkan 'include'
from django.shortcuts import redirect

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('users.urls')), # Arahkan semua request ke 'users.urls'
    path('', lambda request: redirect('signup/', permanent=False)), # Redirect halaman utama ke signup
]