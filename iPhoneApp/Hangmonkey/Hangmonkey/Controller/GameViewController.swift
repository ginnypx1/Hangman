//
//  GameViewController.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 4/9/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var gameWord: UILabel!
    @IBOutlet weak var guessedLetters: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    
    var hangmanGame: HangmanGame!
    var textFieldDelegate = HangmonkeyTextFieldDelegate()

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = textFieldDelegate
       
        // set up the game board
        hangmanGame.setUpGame()
        gameWord.text = hangmanGame.displayWord()
        gameWord.addTextSpacing(spacing: 2.5)
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
        gameWord.text = hangmanGame.displayWord()
        gameWord.addTextSpacing(spacing: 1.5)
    }
    
    func updateGameDisplay() {
        let imageNum = hangmanGame.gamePics[hangmanGame.count]
        let newImage = UIImage(named: imageNum)!
        AnimationManager.transitionAnimation(for: imageView, to: newImage)
        // add the guess to guessedLetters
        let letterString = hangmanGame.missedLetters.joined(separator: " ")
        guessedLetters.text = letterString
    }
    
    // MARK: - Play turn
    
    @IBAction func playTurn(_ sender: UIButton) {
        
        guard let guessedLetter = textField.text?.lowercased() else { return }
        
        if hangmanGame.secretWordArray.contains(Character(guessedLetter)) {
            hangmanGame.correctLetters.append(guessedLetter)
            updateDisplayWord()
            if hangmanGame.checkForWin() {
                presentEndGame()
            }
        } else {
            // update the count and siplay
            hangmanGame.count += 1
            if hangmanGame.count == 6 {
                hangmanGame.gameState = .lose
                presentEndGame()
            } else {
                hangmanGame.missedLetters.append(guessedLetter)
                updateGameDisplay()
            }
        }
        textField.text = ""
    }
            
    // MARK: - Present Win or Loss
    
    func presentEndGame() {
        let gameStateView = self.storyboard?.instantiateViewController(withIdentifier: "GameStateViewController") as! GameStateViewController
        gameStateView.hangmanGame = self.hangmanGame
        gameStateView.modalTransitionStyle = .flipHorizontal
        present(gameStateView, animated: true, completion: nil)
    }
    
}


