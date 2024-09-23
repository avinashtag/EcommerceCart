//
//  LoginHeaderCellTableViewCell.swift
//  EcommerceCart
//
//  Created by Avinash on 20/09/2024.
//

import UIKit

class LoginHeaderCellTableViewCell: UITableViewCell {

    @IBOutlet private var header: UILabel!
    @IBOutlet private var subheader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


class LoginFormCellTableViewCell: UITableViewCell {

    @IBOutlet  var header: UILabel!
    @IBOutlet var textfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


class LoginFormSignInCell: UITableViewCell {

    @IBOutlet private var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


class LoginFormSignUpCell: UITableViewCell {

    @IBOutlet private var button: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
