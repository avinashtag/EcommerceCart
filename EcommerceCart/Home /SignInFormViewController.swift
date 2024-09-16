//
//  SignInFormViewController.swift
//  EcommerceCart
//
//  Created by Avinash on 16/09/2024.
//

import UIKit

class SignInFormCell: UITableViewCell, UITextFieldDelegate{
    @IBOutlet weak var `title`: UILabel!
    @IBOutlet weak var textField: UITextField!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }

}

class SignInFormHeader: UITableViewCell{
//    @IBOutlet weak var `title`: UILabel!
//    @IBOutlet weak var subtitle: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

class SignInFormFooter: UITableViewCell{

    var doSign:(()->Void)?
    
    @IBAction func doSignIn(_ sender: UIButton){
        doSign?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}



class SignInFormViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SignInFormViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SignInFormHeader.self)", for: indexPath) as? SignInFormHeader else { fatalError() }
            
            return cell
            
        case 1, 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SignInFormCell.self)", for: indexPath) as? SignInFormCell else { fatalError() }
            
            
            cell.title.text = indexPath.row == 1 ? "Email" : "Password"
            cell.textField.isSecureTextEntry =  indexPath.row == 2
            return cell

        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SignInFormFooter.self)", for: indexPath) as? SignInFormFooter else { fatalError() }
            cell.doSign = {
                //TODO: Sign in pressed
                
                let email = (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? SignInFormCell)?.textField.text
                let password = (tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? SignInFormCell)?.textField.text

            }
            return cell

        default:
            fatalError()
        }
    }
    
    
}

extension SignInFormViewController: UITableViewDelegate{
    
}
