import random
################ game variables
HANGMANPICS = ['''
  
     +---+
     |   |
         |
         |
         |
         |
  =========''', '''
 
    +---+
    |   |
    O   |
        |
        |
        |
  =========''', '''
 
    +---+
    |   |
    O   |
    |   |
        |
        |
  =========''', '''
 
    +---+
    |   |
    O   |
   /|   |
        |
        |
  =========''', '''
 
    +---+
    |   |
    O   |
   /|\  |
        |
        |
  =========''', '''
 
    +---+
    |   |
    O   |
   /|\  |
   /    |
        |
  =========''', '''
 
    +---+
    |   |
    O   |
   /|\  |
   / \  |
        |
  =========''']

words = ['excavator', 'bulldozer', 'loader', 'grader', 'steamroller', 'paver']

################ game functions
def getRandomWord(wordlist):
	choice = random.randint(0, (len(wordlist)-1))
	return wordlist[choice]


def displayBoard(HANGMANPICS, missedLetters, correctLetters, secretWord):
	print(HANGMANPICS[len(missedLetters)])
	print()

	print('Missed letters:', end=' ')
	for letter in missedLetters:
		print(letter, end=' ')
	print()

	blanks = '_' * len(secretWord)

	for i in range(len(secretWord)):
		if secretWord[i] in correctLetters:
			blanks = blanks[:i] + secretWord[i] + blanks[i+1:]

	for letter in blanks:
		print(letter, end = ' ')
	print()

def choose_letter(alreadyGuessed):
	while True:
		guess = input('Guess a letter: ').lower()
		if len(guess) != 1:
			print('Please enter a single letter.')
		elif guess in alreadyGuessed:
			print('You already guessed this letter. Try again.')
		elif guess not in 'abcdefghijklmnopqrstuvwxyz':
			print('Please enter a letter.')
		else:
			return guess

################## GAMELOOP

missedLetters = ''
correctLetters = ''
secretWord = getRandomWord(words)
gameOver = False

while True:
	displayBoard(HANGMANPICS, missedLetters, correctLetters, secretWord)

	guess = choose_letter(missedLetters + correctLetters)

	if guess in secretWord:
		correctLetters = correctLetters + guess

		foundAll = True
		for i in range(len(secretWord)):
			if secretWord[i] not in correctLetters:
				foundAll = False
		if foundAll:
			print('The word was ' + secretWord + '!!')
			print('Congrats! You won! :)')
			gameOver = True
			break
	else:
		missedLetters = missedLetters + guess

		if len(missedLetters) == len(HANGMANPICS)-1:
			displayBoard(HANGMANPICS, missedLetters, correctLetters, secretWord)
			print('You are dead! The word was ' + secretWord + '.')
			gameOver = True
			break
