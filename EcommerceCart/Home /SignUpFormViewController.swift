//
//  SignUpFormViewController.swift
//  EcommerceCart
//
//  Created by Avinash on 05/09/2024.
//

import UIKit

class SignUpFormViewController: UIViewController {
    
    @IBOutlet weak var helpLabel: UILabel!
    
    @IBOutlet weak var thankLabel: UILabel!
    
    @IBOutlet weak var signinButton: UIButton!
    
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTeextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    let customFont = UIFont.systemFont(ofSize: 17, weight: .bold)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thankLabel.font = self.customFont
        thankLabel.textColor = UIColor.black
        
        helpLabel.font = self.customFont
        helpLabel.textColor = UIColor.accent
        
        
        let signinButtonFullName = "Already have an account? Signin"
        let attributedString  = NSMutableAttributedString(string: signinButtonFullName)
        let signinRange = (signinButtonFullName as NSString).range(of: "Signin")
        
        let signinFont = self.customFont
        attributedString.addAttribute(.font, value: signinFont, range: signinRange)
        
        attributedString.addAttribute(.foregroundColor, value: UIColor.accent, range: signinRange)
        
        let regularRange = (signinButtonFullName as NSString).range(of: "Already have an account?")
        
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: regularRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: regularRange)
        
        signinButton.setAttributedTitle(attributedString, for: .normal)
        
        Helper.addDoneButtonToKeyBoard(textField: fullNameTextField, target: self, action: #selector(doneButtonPressed))
        Helper.addDoneButtonToKeyBoard(textField: emailTextField, target: self, action: #selector(doneButtonPressed))
        Helper.addDoneButtonToKeyBoard(textField: phoneNumberTeextField, target: self, action: #selector(doneButtonPressed))
        Helper.addDoneButtonToKeyBoard(textField: passwordTextField, target: self, action: #selector(doneButtonPressed))
        Helper.addDoneButtonToKeyBoard(textField: confirmPasswordTextField, target: self, action: #selector(doneButtonPressed))
        
    }
    
    @objc func doneButtonPressed(){
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    
    
}
