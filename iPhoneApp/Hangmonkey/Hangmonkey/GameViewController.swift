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
    
    @IBOutlet weak var lblGameWord: UILabel!
    @IBOutlet weak var lblGuessedLetters: UILabel!
    @IBOutlet weak var txtGuess: UITextField!
    @IBOutlet weak var imgNoose: UIImageView!
    
    // MARK: - Properties
    
    var hangmanGame: HangmanGame?

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up text field delegate
        txtGuess.delegate = self
        
        // set up the game board
        guard let hangmanGame = self.hangmanGame else {
            print("Oops. No game has been initiated.")
            return
        }
        hangmanGame.setUpGame()
        
        // display the secretWord as blanks
        lblGameWord.text = displayWord()
        lblGameWord.addTextSpacing(spacing: 1.5)
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
    
    // MARK: - Text Field Delegate
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtGuess.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Display Secret Word
    
    func displayWord() -> String {
        guard let hangmanGame = self.hangmanGame else {
            print("Oops. No game has been initiated.")
            return ""
        }
        
        // displays the secret word with the hidden/guessed letters revealed
        hangmanGame.wordArray.removeAll(keepingCapacity: true)
        for character in hangmanGame.secretWord.characters {
            if hangmanGame.correctLetters.contains(String(character)) {
                hangmanGame.wordArray.append(character)
            } else {
                hangmanGame.wordArray.append("_")
            }
        }
        let wordString = String(hangmanGame.wordArray)
        return wordString
    }
    
    // MARK: - Play turn
    
    @IBAction func btnPlayTurnACTION(_ sender: AnyObject) {
        guard let hangmanGame = self.hangmanGame else {
            print("Oops. No game has been initiated.")
            return
        }

        // play the turn
        if let guessedLetter = txtGuess.text {
            // if guessedLetter is in the secretWord
            if hangmanGame.secretWordArray.contains(Character(guessedLetter)) {
                // add the letter to correctLetters
                hangmanGame.correctLetters.append(guessedLetter)
                // change the secretWord display
                lblGameWord.text = displayWord()
                lblGameWord.addTextSpacing(spacing: 1.5)
                // check to see if game has been won
                hangmanGame.gameState = .win
                for character in hangmanGame.secretWord.characters {
                    if (hangmanGame.correctLetters.contains(String(character))) == false {
                        hangmanGame.gameState = .lose
                    }
                }
                if hangmanGame.gameState == .win {
                    // segue back to view controller
                    let mainView = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! ViewController
                    mainView.hangmanGame = self.hangmanGame
                    present(mainView, animated: true, completion: nil)
                }
                txtGuess.text = ""
            } else {
                // increase the count
                hangmanGame.count += 1
                // end game if count = 6
                if hangmanGame.count == 6 {
                    // segue back to view controller
                    let mainView = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! ViewController
                    mainView.hangmanGame = self.hangmanGame
                    present(mainView, animated: true, completion: nil)
                } else {
                    // add guessedLetter to missedLetters
                    hangmanGame.missedLetters.append(guessedLetter)
                    // change the picture to the next image
                    let imageNum = hangmanGame.gamePics[hangmanGame.count]
                    imgNoose.image = UIImage(named: imageNum)
                    // add the guessed Letter to lblGuessedLetters
                    let letterString = String(describing: hangmanGame.missedLetters)
                    lblGuessedLetters.text = letterString
                }
                txtGuess.text = ""
            }
        }
    }
}

// allows character spacing
extension UILabel {
    func addTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.text!.characters.count))
        self.attributedText = attributedString
    }
}
