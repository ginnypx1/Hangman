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
    
    func test_PickSecretWord_WhenRun_SetsSecretWord() {
        let game = HangmanGame()
        game.pickSecretWord()
        let secretWord = game.secretWord
        XCTAssertNotEqual(secretWord, "")
    }

    
}
