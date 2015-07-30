from tkinter import *
import random

# game variables
wordlist = ['excavator', 'bulldozer', 'loader', 'grader', 'steamroller', 'paver']
missed_letters = ['x', 'y', 'z']
correct_letters = ['e', 'r', 's']
strike_count = ['X', 'X']

def getWord(wordlist):
	choice = random.randint(0, (len(wordlist)-1))
	secret_word = wordlist[choice]
	return secret_word

secret_word = getWord(wordlist)

# root window
root = Tk()
root.title('Hangman!')

# game functions
def showWord(secret_word):
	blanks = '_' * len(secret_word)
	for i in range(len(secret_word)):
		if secret_word[i] in correct_letters:
			blanks = blanks[:i] + secret_word[i] + blanks[i+1:]
	return blanks

word_display = showWord(secret_word)


class GameBoard(Frame):
	def __init__(self, parent=None):
		Frame.__init__(self, parent)
		directions = Label(self, text="Guess my secret word!")
		word_space = Label(self, text=word_display, height=3)
		guess_space = Frame(self)
		guess_dir = Label(guess_space, text="Pick a letter:").pack(side=LEFT)
		guess_ent = Entry(guess_space).pack(side=LEFT, fill=X)
		guess_btn = Button(guess_space, text='Guess').pack(side=LEFT)
		missed = Label(self, text=missed_letters, width=15, height=2)
		strikes = Label(self, text=strike_count, width=15, height=2)
		# pack board
		directions.pack(expand=YES, fill=BOTH)
		word_space.pack(side=TOP, fill=BOTH)
		guess_space.pack(side=TOP, expand=YES, fill=X)
		strikes.pack(side=LEFT, fill=X)
		missed.pack(side=LEFT, fill=X)

# make initial gameboard
gb = GameBoard(root)
gb.pack(side=TOP)

root.mainloop()