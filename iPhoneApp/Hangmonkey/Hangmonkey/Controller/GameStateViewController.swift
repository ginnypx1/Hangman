//
//  GameStateViewController.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 4/9/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class GameStateViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var btnPlayButton: UIButton!
    @IBOutlet weak var lblWinText: UILabel!
    @IBOutlet weak var lblWinStory: UILabel!
    @IBOutlet weak var imgMonkeyPic: UIImageView!
    
    // MARK: - Properties
    
    var hangmanGame: HangmanGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayGameState()
    }
    
    // MARK: - Display start, win or loss
    
    func displayGameState() {
        if hangmanGame == nil {
            hangmanGame = HangmanGame()
        }
        
        switch hangmanGame.gameState {
        case .start:
            displayGameStart()
        case .win:
            displayWin()
        case .lose:
            displayLoss()
        }
    }
    
    func displayGameStart() {
        lblWinText.text = "Hangmonkey"
        lblWinStory.text = "I have a secret word in mind. Can you guess it before the monkey dies?"
        imgMonkeyPic.image = UIImage(named: "Hangman6")
        btnPlayButton.setTitle("Play", for: .normal)
    }
    
    func displayWin() {
        lblWinText.text = "You Win!"
        lblWinStory.text = "Monkey is saved. At least, for now..."
        imgMonkeyPic.image = UIImage(named: "Hangman0")
    }
    
    func displayLoss() {
        lblWinText.text = "You Lose!"
        lblWinStory.text = "Monkey is dead. How could you? Oh, the humanity!"
        imgMonkeyPic.image = UIImage(named: "Hangman6")
    }
    
    // MARK: - Play Game
    
    @IBAction func playGame(_ sender: Any) {
        let gameView = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameView.hangmanGame = self.hangmanGame
        present(gameView, animated: true, completion: nil)
    }

}

