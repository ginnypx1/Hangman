//
//  HangmonkeyGameViewControllerTests.swift
//  HangmonkeyTests
//
//  Created by Ginny Pennekamp on 9/13/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Hangmonkey

class HangmonkeyGameViewControllerTests: XCTestCase {
    
    var sut: GameViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "GameViewController")
            as! GameViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: TODO: inject gameStateDelegate for testing
    
    func test_HasGameWordLabel() {
        XCTAssertNotNil(sut.gameWord)
    }
    
    func test_hasGuessedLettersLabel() {
        XCTAssertNotNil(sut.guessedLetters)
    }
    
    func test_HasTextField() {
        XCTAssertNotNil(sut.textField)
    }
    
    func test_HasImageView() {
        XCTAssertNotNil(sut.imageView)
    }
    
    // MARK: - Test properties
    
    func test_textFieldDelegate_IsSet() {
        XCTAssertNotNil(sut.textFieldDelegate)
    }
    
    // MARK: - Test Game Load
    
    
    func test_hangmanGame_IsCreated() {
        XCTAssertNotNil(sut.hangmanGame)
    }
    
    func test_SetUpGame_SetsUpGame() {
        let game = sut.hangmanGame
        game?.setUpGame()
        XCTAssertNotNil(game?.secretWord)
        XCTAssertNotEqual(game?.secretWordArray.count, 0)
        XCTAssertEqual(game?.correctLetters.count,0)
        XCTAssertEqual(game?.wordArray.count,0)
        XCTAssertEqual(game?.missedLetters.count,0)
    }
    
    func test_displayWord_Exists() {
        let displayWord = sut.gameWord.text
        XCTAssertNotNil(displayWord)
        XCTAssertNotEqual(displayWord, "")
    }
    
    func test_guessedLetters_IsInitiallyEmpty() {
        let guessedLetters = sut.guessedLetters.text
        XCTAssertEqual(guessedLetters, "")
    }
    
    func test_imageView_IsEmptyNoose() {
        let emptyNoose = UIImage(named: "Hangman0")
        let initialImage = sut.imageView.image
        XCTAssertEqual(emptyNoose, initialImage)
    }
    
    func test_playTurn_UpdatesDisplay() {
        let game = sut.hangmanGame
        game?.secretWord = "cat"
        game?.secretWordArray = ["c", "a", "t"]
        sut.updateDisplayWord()
        let initialWord = sut.gameWord.text
        sut.playTurn(withLetter: "c")
        let newWord = sut.gameWord.text
        XCTAssertNotEqual(initialWord, newWord)
    }
    
    func test_playTurn_UpdatesCorrectLetters() {
        let game = sut.hangmanGame
        game?.secretWord = "cat"
        game?.secretWordArray = ["c", "a", "t"]
        sut.updateDisplayWord()
        let initialLetters = game?.correctLetters
        sut.playTurn(withLetter: "c")
        let newLetters = game?.correctLetters
        XCTAssertNotEqual(initialLetters!, newLetters!)
        XCTAssertTrue((newLetters?.contains("c"))!)
    }
    
    func test_playTurn_ProcessesIncorrectGuess() {
        let game = sut.hangmanGame
        game?.secretWord = "cat"
        game?.secretWordArray = ["c", "a", "t"]
        sut.updateDisplayWord()
        let initialLetters = game?.missedLetters
        let initialWord = sut.gameWord.text
        sut.playTurn(withLetter: "d")
        let newWord = sut.gameWord.text
        let newLetters = game?.missedLetters
        XCTAssertEqual(initialWord, newWord)
        XCTAssertNotEqual(initialLetters?.count, newLetters?.count)
        XCTAssertEqual(game?.count, 1)
    }
    
    /*
     // TODO: Test win and loss calls the delegate
 
    func test_playTurn_CallsWin() {
        let game = sut.hangmanGame
        game?.secretWord = "cat"
        game?.secretWordArray = ["c", "a", "t"]
        game?.correctLetters = ["a", "t"]
        sut.playTurn(withLetter: "c")
        XCTAssertTrue((game?.checkForWin())!)
    }
    
    func test_playTurn_CallsLoss() {
        let game = sut.hangmanGame
        game?.secretWord = "cat"
        game?.secretWordArray = ["c", "a", "t"]
        game?.count = 5
        sut.playTurn(withLetter: "d")
        XCTAssertEqual(game?.count, 6)
    }
    */
    
    // TODO: Test presentEndGame dismisses view
 
    
}
