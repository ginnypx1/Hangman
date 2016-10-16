//
//  GameViewController.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 10/16/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit

var winOrLose = 0

var secretWord = ""
var missedLetters = [""]
var correctLetters = [""]
var count = 0

func pickSecretWord() {
    // chooses a secret word to start the game
    // get a random number between 0 and gameWords length
    // extract that word from gameWords and set as secretWord
}

class GameViewController: UIViewController {

    @IBOutlet weak var lblGameWord: UILabel!
    @IBOutlet weak var lblGuessedLetters: UILabel!
    
    @IBOutlet weak var txtGuess: UITextField!
    
    @IBOutlet weak var imgNoose: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Choose a secret word
        // Set the count to zero
        // empty correct letters
        // empty missed letters
        // display the word in lblGameWord as all blanks
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func displayWord() {
        // displays the secret word with the hidden/guessed letters revealed
        // replace every letter in the secretWord with a _
        // for each letter in range of secretWord length
        // if secretWord letter is in correctLetters
        // replace the blank with the actual letter
    }
    
    func counter() -> Int {
        // keeps track of the number of guesses
        count += 1
        return count
    }

    @IBAction func btnPlayTurnACTION(_ sender: AnyObject) {
        // if guessedLetter is in the secretWord
            // add the letter to correctLetters
            // change the secretWord display
        
            // check to see if the word has been solved:
            // winOrLose = 1
            // for eachLetter in secretWord
                // if the letter is not in correctLetters
                // winOrLose = 0
            // if winOrLose still == 1
                // segue to EndGameViewController (winOrLose = 1)
        // else
            // increase the strike count
            // if count == 6
                // segue to EndGameViewController (winOrLose = 0)
            // else
                // add the guessedLetter to missedLetters
                // change the picture to the next image
                // add the guessedLetter to lblGuessedLetters
    }
}
