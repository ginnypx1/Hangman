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
    
    @IBOutlet weak var lblGameWord: UILabel!
    @IBOutlet weak var lblGuessedLetters: UILabel!
    @IBOutlet weak var txtGuess: UITextField!
    @IBOutlet weak var imgNoose: UIImageView!
    
    // MARK: - Properties
    
    var hangmanGame: HangmanGame!

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up the game board
        hangmanGame.setUpGame()
        gameWord.text = hangmanGame.displayWord()
        gameWord.addTextSpacing(spacing: 1.5)
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
    
    // MARK: - Play turn
    
    @IBAction func playTurn(_ sender: UIButton) {
        
        guard let guessedLetter = textField.text else { return }
        
        if hangmanGame.secretWordArray.contains(Character(guessedLetter)) {
            // add the letter to correctLetters
            hangmanGame.correctLetters.append(guessedLetter)
            // change the secretWord display
            gameWord.text = hangmanGame.displayWord()
            gameWord.addTextSpacing(spacing: 1.5)
            // check to see if game has been won
            if hangmanGame.checkForWin() {
                presentEndGame()
            }
        } else {
            // if guessed letter is not in the secret word
            hangmanGame.count += 1
            if hangmanGame.count == 6 {
                hangmanGame.gameState = .lose
                presentEndGame()
            } else {
                // add guessedLetter to missedLetters
                hangmanGame.missedLetters.append(guessedLetter)
                // change the picture to the next image
                let imageNum = hangmanGame.gamePics[hangmanGame.count]
                imageView.image = UIImage(named: imageNum)
                // add the guessed Letter to lblGuessedLetters
                let letterString = String(describing: hangmanGame.missedLetters)
                guessedLetters.text = letterString
            }
        }
        textField.text = ""
    }
            
    // MARK: - Present Win or Loss
    
    func presentEndGame() {
        let gameStateView = self.storyboard?.instantiateViewController(withIdentifier: "GameStateViewController") as! GameStateViewController
        gameStateView.hangmanGame = self.hangmanGame
        present(gameStateView, animated: true, completion: nil)
    }
    
}


