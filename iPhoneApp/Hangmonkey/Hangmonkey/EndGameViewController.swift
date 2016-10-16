//
//  EndGameViewController.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 10/16/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {

    @IBOutlet weak var lblWinText: UILabel!
    @IBOutlet weak var lblWinStory: UILabel!
    @IBOutlet weak var imgMonkeyPic: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        /*
        // change text for win or loss state
        if winOrLose == 0 {
            // loss
            lblWinText.text = "You Lose!"
            lblWinStory.text = "Monkey is dead. How could you? Oh, the humanity!"
            imgMonkeyPic.image = UIImage(named: "Hangman6")
        } else {
            // win
            lblWinText.text = "You Win!"
            lblWinStory.text = "Monkey is saved. At least, for now..."
            imgMonkeyPic.image = UIImage(named: "Hangman0")
        } */
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

    @IBAction func btnPlayAgainACTION(_ sender: AnyObject) {
        // TODO: reset all game variables to zero
        
    }
    
    
}
