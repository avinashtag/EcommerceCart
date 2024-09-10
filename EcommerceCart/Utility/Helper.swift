//
//  Helper.swift
//  EcommerceCart
//
//  Created by Bhavya on 10/09/24.
//

import Foundation
import UIKit

class Helper {
    
    static func addDoneButtonToKeyBoard(textField: UITextField, target: Any, action: Selector){
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: target, action: action)
        
        toolbar.items = [flexSpace, doneButton]
        textField.inputAccessoryView = toolbar
    }
}

