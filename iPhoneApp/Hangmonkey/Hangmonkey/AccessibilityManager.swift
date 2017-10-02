//
//  AccessibilityManager.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 10/2/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

struct AccessibilityManager {
    
    // MARK - Apply Dynamic Text to Button
    
    static func applyDynamicText(to button: UIButton) {
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
    }
}

extension GameStateViewController {
    
    func applyAccessibilityToGameStart() {
        AccessibilityManager.applyDynamicText(to: playButton)
    
        winLabel.accessibilityLabel = "Hangmonkey"
        storyLabel.accessibilityLabel = "I have a secret word in mind. Can you guess it before the monkey dies?"
        imageView.accessibilityLabel = HangmanGame.accessibilityImageLabels[6]
    }
    
    func applyAccessibilityToWin() {
        AccessibilityManager.applyDynamicText(to: playButton)
        
        winLabel.accessibilityLabel = "You Win!"
        storyLabel.accessibilityLabel = "Monkey is saved. At least, for now..."
        imageView.accessibilityLabel = HangmanGame.accessibilityImageLabels[0]
    }
    
    func applyAccessibilityToLoss() {
        AccessibilityManager.applyDynamicText(to: playButton)
        
        winLabel.accessibilityLabel = "You Lose!"
        storyLabel.accessibilityLabel = "Monkey is dead. How could you? Oh, the humanity!"
        imageView.accessibilityLabel = HangmanGame.accessibilityImageLabels[6]
    }
}

extension GameViewController {
    
    func applyAccessibilityToDisplay() {
        imageView.accessibilityLabel =  HangmanGame.accessibilityImageLabels[hangmanGame.count]

        let letterString = hangmanGame.missedLetters.joined(separator: " ")
        guessedLetters.accessibilityLabel = letterString
    }
}
