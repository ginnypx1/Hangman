from django.db import models

# Create your models here.
class SecretWords(models.Model):
	secret_word = models.CharField(max_length=25)

	def __str__(self):
		return self.secret_word