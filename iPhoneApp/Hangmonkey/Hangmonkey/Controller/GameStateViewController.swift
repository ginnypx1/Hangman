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
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
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
        winLabel.text = "Hangmonkey"
        storyLabel.text = "I have a secret word in mind. Can you guess it before the monkey dies?"
        imageView.image = UIImage(named: "Hangman6")
        playButton.setTitle("Play", for: .normal)
    }
    
    func displayWin() {
        winLabel.text = "You Win!"
        storyLabel.text = "Monkey is saved. At least, for now..."
        imageView.image = UIImage(named: "Hangman0")
    }
    
    func displayLoss() {
        winLabel.text = "You Lose!"
        storyLabel.text = "Monkey is dead. How could you? Oh, the humanity!"
        imageView.image = UIImage(named: "Hangman6")
    }
    
    // MARK: - Play Game
    
    @IBAction func playGame(_ sender: Any) {
        let gameView = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameView.hangmanGame = self.hangmanGame
        gameView.modalTransitionStyle = .flipHorizontal
        present(gameView, animated: true, completion: nil)
    }

}

