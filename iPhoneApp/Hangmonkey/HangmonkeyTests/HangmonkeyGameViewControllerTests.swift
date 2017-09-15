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
        sut.hangmanGame = HangmanGame()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: TODO: Do not know how to inject hangman game into Game View Controller
    
    /*
    
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
    
    func test_displayWord_Exists() {
        let displayWord = sut.gameWord.text
        XCTAssertNotNil(displayWord)
        XCTAssertNotEqual(displayWord, "")
    }
    
    func test_guessedLetters_IsInitiallyEmpty() {
        let guessedLetters = sut.guessedLetters.text
        XCTAssertNil(guessedLetters)
    }
    
    func test_imageView_IsEmptyNoose() {
        let emptyNoose = UIImage(named: "Hangman0")
        let initialImage = sut.imageView.image
        XCTAssertEqual(emptyNoose, initialImage)
    }
    */
}
