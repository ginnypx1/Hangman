import PIL.Image
import PIL.ImageTk
import random

from quitter import Quitter
from tkinter import *


class Hangman(Frame):
	"Creates an app that plays a game of hangman"
	def __init__(self, parent=None):
		Frame.__init__(self, parent)

		# game variables
		self.wordlist = ['monkey',
							'zebra',
							'giraffe',
							'tiger',
							'elephant',
							'iguana',
							'hippopotamus',
							'rhinoceros',
							'chimpanzee',
							'orangutan',
							'hyena',
							'gorilla',
							'leopard',
							'bobcat',
							'flamingo',
							'alligator',
							'crocodile',
							'parrot']
		self.pics = ['img/Hangman0.png',
						'img/Hangman1.png',
						'img/Hangman2.png',
						'img/Hangman3.png',
						'img/Hangman4.png',
						'img/Hangman5.png',
						'img/Hangman6.png']
		self.secret_word = self.getWord()
		self.missed_letters = ''
		self.correct_letters = ''
		self.count = 0

		# create game directions
		directions = Label(self, text="Guess my secret word!")
		directions.config(height=2, fg='white', bg='tomato')
		directions.pack(side=TOP, fill=X)

		# create space for the secret word
		word_space = Label(self, height=5)
		word_display = self.showWord(word_space)
		word_space.pack(side=TOP, fill=X, pady=10)

		# create a space for strike/ missed letter information
		miss = Frame(self)
		start_pic = PIL.Image.open(self.pics[0])
		start_load = PIL.ImageTk.PhotoImage(start_pic)
		strike_pics = Label(miss, image=start_load)
		strike_pics.image = start_load
		strike_pics.pack(side=LEFT)
		miss_lets = Label(miss)
		miss_lets.pack(side=RIGHT)
		miss.pack(side=TOP)

		# create an entry for your guess
		guess_space = Frame(self)
		guess_space.config(bg='lime green')
		var = StringVar()
		guess_dir = Label(guess_space, text="Pick a letter:")
		guess_dir.config(bg='lime green')
		guess_dir.pack(side=LEFT, padx=10, pady=10)
		guess_ent = Entry(guess_space, textvariable=var)
		guess_ent.config(bg='gold')
		guess_ent.pack(side=RIGHT, padx=10, pady=10)
		guess_space.pack(side=TOP, pady=5)

		# create a button to enter guess
		guess_btn = Button(self, text='GUESS')
		guess_btn.config(command=(lambda: self.turn(var.get(), word_space, directions, strike_pics, miss_lets)))
		guess_btn.pack(side=TOP, fill=X, padx=10)

		# create buttons for play again and quit
		stop_space = Frame(self)
		new_game = Button(stop_space, text='New Game')
		new_game.config(command=(lambda: self.new_game(word_space, directions, strike_pics, miss_lets, start_load)))
		new_game.pack(side=LEFT, padx=10)
		quit = Quitter(stop_space).pack(side=RIGHT)
		stop_space.pack(side=TOP, fill=X)

	def getWord(self):
		"Chooses a secret word to begin the game"
		choice = random.randint(0, (len(self.wordlist)-1))
		secret_word = self.wordlist[choice]
		return secret_word

	def showWord(self, tag):
		"Displays the secret word with hidden/guessed letters revealed"
		blanks = '_' * len(self.secret_word)
		for i in range(len(self.secret_word)):
			if self.secret_word[i] in self.correct_letters:
				blanks = blanks[:i] + self.secret_word[i] + blanks[i+1:]
		tag.config(text=blanks)

	def counter(self):
		"Keeps track of the number of strikes"
		self.count += 1
		return self.count

	def new_game(self, ws_tag, dir_tag, sp_tag, ml_tag, start_load):
		"Starts a new game of hangman"
		self.secret_word = self.getWord()
		self.count = 0
		self.correct_letters = ''
		self.missed_letters = ''
		word_display = self.showWord(ws_tag)
		ws_tag.config(text=word_display)
		dir_tag.config(text="Guess my secret word!")
		sp_tag.config(image=start_load)
		sp_tag.image = start_load
		ml_tag.config(text='')

	def turn(self, letter, ws_tag, dir_tag, sp_tag, ml_tag):
		"Gameloop to reveal the word before getting 6 strikes"
		if letter in self.secret_word:
			# add letter to correct_letters
			self.correct_letters = self.correct_letters + letter
			# change the secret_word display
			new_word = self.showWord(ws_tag)
			# if all of the letters in correct_letters are in secret_word:
			foundAll = True
			for i in range(len(self.secret_word)):
				if self.secret_word[i] not in self.correct_letters:
					foundAll = False
				# initiate win message
			if foundAll:
				dir_tag.config(text=" You win! Monkey lives!")
				dir_tag.config(bg='orange')
		else:
			# increase the strike count by one
			total = self.counter()
			# if strike count == 6:
			if total == 6:
				# initiate loss message
				dir_tag.config(text="My word was {}. You lose. Monkey dies.".format(self.secret_word.upper()))
				dir_tag.config(bg='dodger blue')
			else:
				self.missed_letters = self.missed_letters + letter
				# change the display of strike count
				pic = self.pics[total]
				load = PIL.Image.open(pic)
				render = PIL.ImageTk.PhotoImage(load)
				sp_tag.config(image=render)
				sp_tag.image = render
				# changes the display of missed letters
				ml_tag.config(text=self.missed_letters)


if __name__ == '__main__':
	root = Tk()
	root.title('Hangmonkey')
	hm = Hangman(root)
	hm.pack(side=TOP)
	root.mainloop()
