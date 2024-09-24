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
    @IBOutlet weak var errorLabel: UILabel!
    
    var textChanged: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        errorLabel.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.textColor = .red
        errorLabel.isHidden = false
        textField.setErrorBorderWithVibration()
    }
    
    func hideError() {
        errorLabel.isHidden = true
        textField.resetBorder()
    }
    
}

class SignInFormHeader: UITableViewCell{
    
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



class SignInFormViewController: UIViewController{
    
    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func navigateToTabController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           
           // Instantiate the TabBarController using its Storyboard ID
           if let tabBarVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController {
               
               // Optional: Customize the tabBarController before presenting it (if needed)
               tabBarVC.selectedIndex = 0  // Set the default selected tab if needed
               
               // Present the TabBarController
               tabBarVC.modalPresentationStyle = .fullScreen  // Optional: Present fullscreen (especially for iOS 13+)
               self.present(tabBarVC, animated: true, completion: nil)
           }
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
                let emailRow = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? SignInFormCell
                let passwordRow = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? SignInFormCell
                let email = emailRow?.textField.text ?? ""
                let password = passwordRow?.textField.text ?? ""
                print(email, password)
                
                //Unncomment later fixing Signin or other screens
                
//                if(!self.isValidEmail(email)){
//                    emailRow?.showError("Please enter a valid email")
//                }else {
//                    emailRow?.hideError()
//                }
//                
//                if(password == ""){
//                    passwordRow?.showError("Password is required")
//                }else{
//                    passwordRow?.hideError()
//                }
                
//                if(self.isValidEmail(email) && password != ""){
                    self.navigateToTabController()
//                }
                
            }
            return cell
            
        default:
            fatalError()
        }
    }
    
    
}
extension UITextField {
    // Add error border and trigger haptic feedback
    func setErrorBorderWithVibration() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = 5.0
        
        // Trigger haptic feedback (vibration)
        let feedbackGenerator = UINotificationFeedbackGenerator()
        feedbackGenerator.notificationOccurred(.error)
    }
    
    func resetBorder() {
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
    }
}

extension SignInFormViewController: UITableViewDelegate{
    
}
