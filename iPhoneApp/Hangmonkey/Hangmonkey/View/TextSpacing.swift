//
//  TextSpacing.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 9/12/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

// MARK: - Allow Character Spacing

extension UILabel {
    func addTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSAttributedStringKey.kern, value: spacing, range: NSRange(location: 0, length: self.text!.characters.count))
        self.attributedText = attributedString
    }
}
