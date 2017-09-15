//
//  HangmonkeyTextFieldDelegate.swift
//  Hangmonkey
//
//  Created by Ginny Pennekamp on 9/14/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

// MARK: - Text Field Delegate

class HangmonkeyTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        // restricts length of entry to 1 letter
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= 1
    }
    
}
