//
//  GameViewController.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 10/16/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit

var winOrLose = 0

var secretWord: String = ""
var secretWordArray = [Character]()
var wordArray = [Character]()
var missedLetters = [String]()
var correctLetters = [String]()
var count: Int = 0

func pickSecretWord() {
    // chooses a secret word to start the game
    let randomNumber = Int(arc4random_uniform(UInt32(gameWords.count)))
    secretWord = gameWords[randomNumber]
}

class GameViewController: UIViewController {

    @IBOutlet weak var lblGameWord: UILabel!
    @IBOutlet weak var lblGuessedLetters: UILabel!
    @IBOutlet weak var txtGuess: UITextField!
    @IBOutlet weak var imgNoose: UIImageView!
    
    // MARK: - Apple functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpGame()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtGuess.resignFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setUpGame() {
        // Choose a secret word
        pickSecretWord()
        print(secretWord)
        for character in secretWord.characters {
            secretWordArray.append(character)
        }
        // Set the count to zero
        count = 0
        // empty arrays
        correctLetters.removeAll(keepingCapacity: true)
        wordArray.removeAll(keepingCapacity: true)
        missedLetters.removeAll(keepingCapacity: true)
        // display the secretWord as blanks
        lblGameWord.text = displayWord()
        lblGameWord.addTextSpacing(spacing: 1.5)
        
    }
    
    func displayWord() -> String {
        // displays the secret word with the hidden/guessed letters revealed
        wordArray.removeAll(keepingCapacity: true)
        for character in secretWord.characters {
            if correctLetters.contains(String(character)) {
                wordArray.append(character)
            } else {
                wordArray.append("_")
            }
        }
        let wordString = String(wordArray)
        return wordString
    }


    @IBAction func btnPlayTurnACTION(_ sender: AnyObject) {
        // TODO: Error handling (if nothing in text field or more than one character)
        if let guessedLetter = txtGuess.text {
            // if guessedLetter is in the secretWord
            if secretWordArray.contains(Character(guessedLetter)) {
                // add the letter to correctLetters
                correctLetters.append(guessedLetter)
                // change the secretWord display
                lblGameWord.text = displayWord()
                lblGameWord.addTextSpacing(spacing: 1.5)
                // check to see if game has been won
                winOrLose = 1
                for character in secretWord.characters {
                    if (correctLetters.contains(String(character))) == false {
                        winOrLose = 0
                    }
                }
                if winOrLose == 1 {
                    // TODO: segue to EndGameViewController
                    // let endView = EndGameViewController()
                    // self.present(endView, animated: true, completion: nil)
                    print("You Win!")
                }
            } else {
                // increase the count
                count += 1
                // end game if count = 6
                if count == 6 {
                    // TODO: segue to EndGameViewController
                    // let endView = EndGameViewController()
                    // self.present(endView, animated: true, completion: nil)
                    print("You lose!")
                } else {
                    // add guessedLetter to missedLetters
                    missedLetters.append(guessedLetter)
                    // change the picture to the next image
                    let imageNum = gamePics[count]
                    imgNoose.image = UIImage(named: imageNum)
                    // add the guessed Letter to lblGuessedLetters
                    let letterString = String(describing: missedLetters)
                    lblGuessedLetters.text = letterString
                }
            }
        }
    }
}

// allows character spacing
extension UILabel{
    func addTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.text!.characters.count))
        self.attributedText = attributedString
    }
}
