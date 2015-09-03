from django.core.urlresolvers import reverse
from django.test import TestCase

from .models import SecretWords

# Create your tests here.
class ModelTest(TestCase):
	def test_model_creation(self):
		word = SecretWords.objects.create(secret_word="dodo")
		self.assertIn(word.secret_word, "dodo")


class ViewTest(TestCase):
	def test_model_view(self):
		resp = self.client.get(reverse('hangmonkeygame:game'))
		self.assertEqual(resp.status_code, 200)
		self.assertTemplateUsed(resp, 'hangmonkey/game.html')