//
//  AnimationManager.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 9/14/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

struct AnimationManager {
    
    static func transitionAnimation(for imageView: UIImageView, to image: UIImage) {
        // "flips" the image to reveal the next
        let opts: UIViewAnimationOptions = [.transitionFlipFromLeft]
        UIView.transition(with: imageView, duration: 1, options: opts, animations: {
            imageView.image = image
        })
    }
}
