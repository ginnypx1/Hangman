//
//  HangmonkeyGameStateViewControllerTests.swift
//  HangmonkeyTests
//
//  Created by Ginny Pennekamp on 9/13/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Hangmonkey

class HangmonkeyGameStateViewControllerTests: XCTestCase {
    
    var sut: GameStateViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "GameStateViewController")
            as! GameStateViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test outlets exist
    
    func test_HasPlayButton() {
        XCTAssertNotNil(sut.playButton)
    }
    
    func test_HasWinLabel() {
        XCTAssertNotNil(sut.winLabel)
    }
    
    func test_HasWinStory() {
        XCTAssertNotNil(sut.storyLabel)
    }
    
    func test_HasImageView() {
        XCTAssertNotNil(sut.imageView)
    }
    
    // MARK: - Test viewDidLoad loads game if needed
    
    func test_HangmanGame_Inits_InViewDidLoad() {
        XCTAssertNotNil(sut.hangmanGame)
    }
    
    // MARK: - Test displayGameState
    
    func test_displayGameState_displaysStart() {
        let winText = sut.winLabel.text
        let storyText = sut.storyLabel.text
        let image = sut.imageView.image
        let buttonTitle = sut.playButton.title(for: .normal)
        XCTAssertEqual(winText, "Hangmonkey")
        XCTAssertEqual(storyText, "I have a secret word in mind. Can you guess it before the monkey dies?")
        XCTAssertEqual(image, UIImage(named: "Hangman6"))
        XCTAssertEqual(buttonTitle, "Play")
    }
    
    func test_displayGameState_displaysWin() {
        sut.hangmanGame.gameState = GameState.win
        sut.displayGameState()
        let winText = sut.winLabel.text
        let storyText = sut.storyLabel.text
        let image = sut.imageView.image
        XCTAssertEqual(winText, "You Win!")
        XCTAssertEqual(storyText, "Monkey is saved. At least, for now...")
        XCTAssertEqual(image, UIImage(named: "Hangman0"))
    }
    
    func test_displayGameState_displaysLoss() {
        sut.hangmanGame.gameState = GameState.lose
        sut.displayGameState()
        let winText = sut.winLabel.text
        let storyText = sut.storyLabel.text
        let image = sut.imageView.image
        XCTAssertEqual(winText, "You Lose!")
        XCTAssertEqual(storyText, "Monkey is dead. How could you? Oh, the humanity!")
        XCTAssertEqual(image, UIImage(named: "Hangman6"))
    }

    // TODO: Test that play game transitions to GameViewController
    
}
