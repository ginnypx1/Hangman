//
//  GameViewController.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 4/9/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

protocol GameStateDelegate {
    func presentEndGame(_ gameState: GameState)
}

class GameViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var gameWord: UILabel!
    @IBOutlet weak var guessedLetters: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    
    var hangmanGame: HangmanGame!
    
    var gameStateDelegate: GameStateDelegate!
    var textFieldDelegate = HangmonkeyTextFieldDelegate()

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = textFieldDelegate
        
        // create game if needed
        hangmanGame = HangmanGame()
        
        // set up the game board
        hangmanGame.setUpGame()
        updateDisplayWord()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // subscribe to keyboard notifications
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // unsubscribe to keyboard notifications
        unsubscribeToKeyboardNotifications()
    }
    
    // MARK: - Update Display
    
    func updateDisplayWord() {
        let displayWord = hangmanGame.displayWord()
        gameWord.text = displayWord
        gameWord.accessibilityLabel = displayWord
        gameWord.addTextSpacing(spacing: 2.5)
    }
    
    func updateGameDisplay() {
        let imageNum = hangmanGame.gamePics[hangmanGame.count]
        let newImage = UIImage(named: imageNum)!
        AnimationManager.transitionAnimation(for: imageView, to: newImage)
        
        // add the guess to guessedLetters
        let letterString = hangmanGame.missedLetters.joined(separator: " ")
        guessedLetters.text = letterString
        
        applyAccessibilityToDisplay()
    }
    
    // MARK: - Play turn
    
    func playTurn(withLetter letter: String) {
        if hangmanGame.secretWordArray.contains(Character(letter)) {
            hangmanGame.correctLetters.append(letter)
            updateDisplayWord()
            if hangmanGame.checkForWin() {
                gameStateDelegate.presentEndGame(.win)
                presentEndGame()
            }
        } else {
            // update the count and display
            hangmanGame.count += 1
            if hangmanGame.count == 6 {
                gameStateDelegate.presentEndGame(.lose)
                presentEndGame()
            } else {
                hangmanGame.missedLetters.append(letter)
                updateGameDisplay()
            }
        }
    }
    
    @IBAction func chooseLetter(_ sender: UIButton) {
        guard let guessedLetter = textField.text?.lowercased() else { return }
        if guessedLetter == "" { return }
        playTurn(withLetter: guessedLetter)
        textField.text = ""
        textField.placeholder = "abcdefghijklmnopqrstuvwxyz"
    }
            
    // MARK: - Present Win or Loss
    
    func presentEndGame() {
        dismiss(animated: true, completion: nil)
    }
    
}


