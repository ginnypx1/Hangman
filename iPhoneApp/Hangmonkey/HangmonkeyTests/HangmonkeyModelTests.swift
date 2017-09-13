//
//  HangmonkeyModelTests.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 4/11/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Hangmonkey

class HangmonkeyModelTests: XCTestCase {
    
    var sut: HangmanGame!
    
    override func setUp() {
        super.setUp()
        // init game
        sut = HangmanGame()
    }
    
    override func tearDown() {
        // deinit game
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test Properties
    
    func test_HangmanGame_HasGameState() {
        let gameState = sut.gameState
        XCTAssertNotNil(gameState)
    }
    
    func test_HangmanGame_HasSecretWord() {
        let secretWord = sut.secretWord
        XCTAssertNotNil(secretWord)
    }
    
    func test_HangmanGame_HasSecretWordArray() {
        let secretWordArray = sut.secretWordArray
        XCTAssertNotNil(secretWordArray)
    }
    
    func test_HangmanGame_HasWordArray() {
        let wordArray = sut.wordArray
        XCTAssertNotNil(wordArray)
    }
    
    func test_HangmanGame_HasMissedLetters() {
        let missedLetters = sut.missedLetters
        XCTAssertNotNil(missedLetters)
    }
    
    func test_HangmanGame_HasCorrectLetters() {
        let correctLetters = sut.correctLetters
        XCTAssertNotNil(correctLetters)
    }
    
    func test_HangmanGame_HasCount() {
        let count = sut.count
        XCTAssertNotNil(count)
    }
    
    func test_gameWords_containsWords() {
        let gameWords = sut.gameWords
        XCTAssertNotEqual(gameWords.count, 0)
    }
    
    func test_gamePics_containsImageNames() {
        let gamePics = sut.gamePics
        XCTAssertNotEqual(gamePics.count, 0)
    }
    
    // MARK: - Test Property Initialization
    
    func test_HangmanGame_InitialGameState_IsStart() {
        let gameState = sut.gameState
        XCTAssertEqual(gameState, GameState.start)
    }
    
    func test_HangmanGame_InitialSecretWord_IsEmpty() {
        let secretWord = sut.secretWord
        XCTAssertEqual(secretWord, "")
    }
    
    func test_HangmanGame_InitialSecretWordArray_IsEmpty() {
        let secretWordArray = sut.secretWordArray
        XCTAssertEqual(secretWordArray.count, 0)
    }
    
    func test_HangmanGame_InitialWordArray_IsEmpty() {
        let wordArray = sut.wordArray
        XCTAssertEqual(wordArray.count, 0)
    }
    
    func test_HangmanGame_InitialMissedLetters_IsEmpty() {
        let missedLetters = sut.missedLetters
        XCTAssertEqual(missedLetters.count, 0)
    }
    
    func test_HangmanGame_InitialCorrectLetters_IsEmpty() {
        let correctLetters = sut.correctLetters
        XCTAssertEqual(correctLetters.count, 0)
    }
    
    func test_HangmanGame_InitialCount_IsZero() {
        let count = sut.count
        XCTAssertEqual(count, 0)
    }
    
    func test_HangmanGame_GamePics_HasProperContent() {
        let gamePics = sut.gamePics
        let firstImage = UIImage(named: gamePics[0])
        let expectedImage = UIImage(named: "Hangman0")
        XCTAssertEqual(firstImage, expectedImage)
        let expectedArray = ["Hangman0", "Hangman1", "Hangman2", "Hangman3", "Hangman4", "Hangman5", "Hangman6"]
        XCTAssertEqual(gamePics, expectedArray)
    }
    
    // MARK: - Test Methods
    
    func test_PickSecretWord_SetsSecretWord() {
        let game = HangmanGame()
        game.pickSecretWord()
        let secretWord = game.secretWord
        XCTAssertNotEqual(secretWord, "")
    }
    
    func test_SetUpGame_WhenRun_SetsGameProperties() {
        sut.setUpGame()
        let secretWord = sut.secretWord
        let secretWordArray = sut.secretWordArray
        let correctLetters = sut.correctLetters
        let wordArray = sut.wordArray
        let missedLetters = sut.missedLetters
        XCTAssertNotEqual(secretWord, "")
        XCTAssertNotEqual(secretWordArray, [])
        XCTAssertEqual(correctLetters, [])
        XCTAssertEqual(wordArray, [])
        XCTAssertEqual(missedLetters, [])
    }
    
    func test_DisplayWord_DisplaysProperly() {
        sut.secretWord = "cat"
        sut.wordArray = ["c", "a"]
        sut.correctLetters = ["c", "a"]
        let displayWord = sut.displayWord()
        XCTAssertEqual(displayWord, "ca_")
    }
    
    func test_CheckForWin_callsCorrectWin() {
        sut.secretWord = "cat"
        sut.correctLetters = ["c", "a", "t"]
        let result = sut.checkForWin()
        XCTAssertEqual(result, true)
        XCTAssertEqual(sut.gameState, GameState.win)
    }
    
    func test_CheckForWin_catchesLoss() {
        sut.secretWord = "cat"
        sut.correctLetters = ["c", "a"]
        let result = sut.checkForWin()
        XCTAssertEqual(result, false)
        XCTAssertEqual(sut.gameState, GameState.lose)
    }

    
}
