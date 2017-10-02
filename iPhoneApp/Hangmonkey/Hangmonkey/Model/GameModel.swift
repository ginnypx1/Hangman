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
    
    // MARK: - Game Variables
    
    var secretWord: String = ""
    var secretWordArray = [Character]()
    var wordArray = [Character]()
    var missedLetters = [String]()
    var correctLetters = [String]()
    var count: Int = 0
    
    // MARK: - Game Methods
    
    func pickSecretWord() {
        let randomNumber = Int(arc4random_uniform(UInt32(gameWords.count)))
        self.secretWord = gameWords[randomNumber]
    }
    
    func setUpGame() {
        self.pickSecretWord()
        print("The secret word is: \(secretWord)")
        
        for character in secretWord.characters {
            self.secretWordArray.append(character)
        }
        
        self.count = 0
        
        self.correctLetters.removeAll(keepingCapacity: true)
        self.wordArray.removeAll(keepingCapacity: true)
        self.missedLetters.removeAll(keepingCapacity: true)
    }
    
    func displayWord() -> String {
        wordArray.removeAll(keepingCapacity: true)
        for character in secretWord.characters {
            if correctLetters.contains(String(character)) {
                wordArray.append(character)
            } else {
                wordArray.append("_")
            }
        }
        let wordString = String(wordArray)
        return wordString
    }
    
    func checkForWin() -> Bool {
        for character in secretWord.characters {
            if (correctLetters.contains(String(character))) == false {
                return false
            }
        }
        return true
    }
    
    // MARK: - Game Constants
    
    let gameWords = [
        "alligator",
        "anteater",
        "armadillo",
        "baboon",
        "bear",
        "bobcat",
        "bullfrog",
        "butterfly",
        "camel",
        "cheetah",
        "chimpanzee",
        "chinchilla",
        "cobra",
        "cockroach",
        "crane",
        "cricket",
        "crocodile",
        "dog",
        "earthworm",
        "elephant",
        "emu",
        "fox",
        "flamingo",
        "gazelle",
        "gecko",
        "giraffe",
        "gorilla",
        "grasshopper",
        "heron",
        "hippopotamus",
        "hyena",
        "iguana",
        "jaguar",
        "kangaroo",
        "kookaburra",
        "ladybug",
        "lemur",
        "leopard",
        "lion",
        "lizard",
        "mongoose",
        "monkey",
        "newt",
        "opossum",
        "orangutan",
        "ostrich",
        "otter",
        "owl",
        "panda",
        "parrot",
        "pelican",
        "penguin",
        "porcupine",
        "puma",
        "python",
        "quail",
        "rabbit",
        "rattlesnake",
        "rhinoceros",
        "salamander",
        "scorpion",
        "seal",
        "sheep",
        "sloth",
        "spider",
        "squirrel",
        "tapir",
        "tarantula",
        "tiger",
        "tortoise",
        "turtle",
        "vulture",
        "warthog",
        "wolf",
        "woodpecker",
        "yak",
        "zebra"
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

    static var accessibilityImageLabels = [
        "Empty Noose",
        "Sockmonkey head hanging from noose",
        "Sockmonkey head and body hanging from noose",
        "Sockmonkey head, body, and right arm hanging from noose",
        "Sockmonkey head, body, and arms hanging from noose",
        "Sockmonkey head, body, arms, and right leg hanging from noose",
        "Sockmonkey, hanging from noose, dead"
    ]
}

