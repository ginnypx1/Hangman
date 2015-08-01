from quitter import Quitter
from tkinter import *
import random

class Hangman(Frame):
	"Creates an app that plays a game of hangman"
	def __init__(self, parent=None):
		Frame.__init__(self, parent)
		self.wordlist = ['excavator', 'bulldozer', 'loader', 'grader', 'steamroller', 'paver']
		self.secret_word = self.getWord()
		self.missed_letters = ''
		self.correct_letters = ' '
		self.count = 0

		# create game directions
		directions = Label(self, text="Guess my secret word!")
		directions.pack(expand=YES, fill=BOTH)

		# create space for the secret word
		word_space = Label(self, height=3)
		word_display = self.showWord(word_space)
		word_space.pack(side=TOP, fill=BOTH)

		# create a space for other game information
		miss = Label(self, height=2)
		miss.pack(side=TOP, fill=BOTH)

		# create an entry for your guess
		guess_space = Frame(self)
		var = StringVar()
		guess_dir = Label(guess_space, text="Pick a letter:").pack(side=LEFT)
		guess_ent = Entry(guess_space, textvariable=var).pack(side=LEFT, fill=X)
		guess_btn = Button(guess_space, text='Guess', command=(lambda: self.turn(var.get(), word_space, directions, miss))).pack(side=RIGHT)
		guess_space.pack(side=TOP, expand=YES, fill=X)

		# create buttons for play again and quit
		stop_space = Frame(self)
		new_game = Button(stop_space, text='Play again!', command = (lambda: self.new_game(word_space, directions, miss))).pack(side=LEFT)
		quit = Quitter(stop_space).pack(side=RIGHT)
		stop_space.pack(side=TOP, fill=BOTH)

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

	def new_game(self, ws_tag, dir_tag, sm_tag):
		self.secret_word = self.getWord()
		self.count = 0
		self.correct_letters = ''
		self.missed_letters = ''
		word_display = self.showWord(ws_tag)
		ws_tag.config(text=word_display)
		dir_tag.config(text="Guess my secret word!")
		sm_tag.config(text=' ')

	def turn(self, letter, ws_tag, dir_tag, sm_tag):
		"Gameloop to reveal the word before getting 6 strikes"
		# if letter in secret_word
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
				dir_tag.config(text="That's it! You win! :)")
		# if the letter is not in the secret word
		else:
			# increase the strike count by one
			total = self.counter()
			# if strike count == 6:
			if total == 6:
				# initiate loss message
				dir_tag.config(text="My word was {}. Sorry. You lose. :(".format(self.secret_word))
			else:
				self.missed_letters = self.missed_letters + letter
				# change the display of strike count/ missed letters
				sm_tag.config(text=str(total) + ' ' + self.missed_letters)
	

if __name__ == '__main__':
	root = Tk()
	root.title('Hangman')
	hm = Hangman(root)
	hm.pack(side=TOP)
	root.mainloop()