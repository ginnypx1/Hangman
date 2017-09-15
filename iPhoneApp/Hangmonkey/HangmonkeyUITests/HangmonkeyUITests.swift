//
//  HangmonkeyUITests.swift
//  HangmonkeyUITests
//
//  Created by Ginny Pennekamp on 9/15/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest

class HangmonkeyUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGame() {
        
        // test play button exists
        let playButton = app/*@START_MENU_TOKEN@*/.buttons["PlayButton"]/*[[".buttons[\"Play Button\"]",".buttons[\"PlayButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(playButton.exists)
        
        // test game starts when tap button
        playButton.tap()
        
        // test text field exists
        let guessTextField = app/*@START_MENU_TOKEN@*/.textFields["GuessTextField"]/*[[".textFields[\"abcdefghijklmnopqrstuvwxyz\"]",".textFields[\"GuessTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(guessTextField.exists)
        
        // test choose button exists
        let chooseLetterButton = app/*@START_MENU_TOKEN@*/.buttons["ChooseLetterButton"]/*[[".buttons[\"Choose Letter Button\"]",".buttons[\"ChooseLetterButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(chooseLetterButton.exists)
        
        app.textFields["GuessTextField"].tap()
        app.textFields["GuessTextField"].accessibilityElementIsFocused()
        app.textFields["GuessTextField"].typeText("a")
        
        let guesstextfieldTextField2 = app.textFields["GuessTextField"]
        guesstextfieldTextField2.typeText("l")
        
        app.buttons["ChooseLetterButton"].tap()
        
    }
    
}
