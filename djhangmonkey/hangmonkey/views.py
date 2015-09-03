from django.shortcuts import render

from .models import SecretWords

# Create your views here.
def show_game(request):
	return render(request, 'hangmonkey/game.html')