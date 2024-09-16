//
//  AuthTableViewCell.swift
//  EcommerceCart
//
//  Created by Bhavya on 15/09/24.
//

import UIKit

protocol AuthTableViewCellDelegate: AnyObject{
    func signInButtonTapped()
    func signUpButtonTapped()
}

class AuthTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    weak var delegate: AuthTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


        @IBAction func signInButtonTapped(_ sender: UIButton) {
            delegate?.signInButtonTapped()
        }

        @IBAction func signUpButtonTapped(_ sender: UIButton) {
            delegate?.signUpButtonTapped()
        }
}
