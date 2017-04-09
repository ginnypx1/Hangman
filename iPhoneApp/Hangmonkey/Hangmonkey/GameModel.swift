//
//  GameModel.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 4/9/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation

enum GameState {
    case start
    case win
    case lose
}

class HangmanGame {
    
    var gameState: GameState = .start
    
    var secretWord: String = ""
    var secretWordArray = [Character]()
    var wordArray = [Character]()
    var missedLetters = [String]()
    var correctLetters = [String]()
    var count: Int = 0
    
    func pickSecretWord() {
        // chooses a secret word to start the game
        let randomNumber = Int(arc4random_uniform(UInt32(gameWords.count)))
        self.secretWord = gameWords[randomNumber]
    }
    
    func setUpGame() {
        // Choose a secret word
        self.pickSecretWord()
        print(secretWord)
        for character in secretWord.characters {
            self.secretWordArray.append(character)
        }
        // Set the count to zero
        self.count = 0
        // empty arrays
        self.correctLetters.removeAll(keepingCapacity: true)
        self.wordArray.removeAll(keepingCapacity: true)
        self.missedLetters.removeAll(keepingCapacity: true)
    }
    
    let gameWords = [
        "monkey",
        "zebra",
        "giraffe",
        "tiger",
        "elephant",
        "iguana",
        "hippopotamus",
        "rhinoceros",
        "chimpanzee",
        "orangutan",
        "hyena",
        "gorilla",
        "leopard",
        "bobcat",
        "flamingo",
        "alligator",
        "crocodile",
        "parrot"
    ]
    
    let gamePics = [
        "Hangman0",
        "Hangman1",
        "Hangman2",
        "Hangman3",
        "Hangman4",
        "Hangman5",
        "Hangman6"
    ]
}

