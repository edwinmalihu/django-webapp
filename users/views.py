# users/views.py
from django.shortcuts import render, redirect
from .forms import SignUpForm

def sign_up(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save() # Menyimpan pengguna baru ke database
            return redirect('/') # Arahkan ke halaman utama setelah berhasil
    else:
        form = SignUpForm()
    return render(request, 'users/signup.html', {'form': form})