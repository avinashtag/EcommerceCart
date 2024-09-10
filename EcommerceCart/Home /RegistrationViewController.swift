//
//  RegistrationViewController.swift
//  EcommerceCart
//
//  Created by Avinash on 05/09/2024.
//

import UIKit

class RegistrationViewController: UIViewController {

    
    @IBOutlet private weak var signUp: UIButton!
    @IBOutlet private weak var signIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        signUp.layer.cornerRadius = 5
        signIn.layer.cornerRadius = 5
        signIn.layer.borderWidth = 1
        signIn.layer.borderColor = UIColor.black.cgColor
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showSignUpForm"{
            guard segue.destination is SignUpFormViewController else { return }
//            signupFormviewController.
        }
    }
    
    
    
    //Mark: IBActions
    
    @IBAction func doSignUp(_ sender: UIButton) {
    }
    
    
    @IBAction func doSignIn(_ sender: UIButton) {
    }
    

}
