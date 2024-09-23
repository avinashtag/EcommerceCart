//
//  LoginTableViewController.swift
//  EcommerceCart
//
//  Created by Bhavya on 15/09/24.
//

import UIKit


class LoginTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section{
        case 0: return 1
        case 1, 2: return 2
        default : return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
           
        case 0:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(LoginHeaderCellTableViewCell.self)", for: indexPath) as? LoginHeaderCellTableViewCell else { fatalError() }
            
            
            return cell
            
            
        case 1:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(LoginFormCellTableViewCell.self)", for: indexPath) as? LoginFormCellTableViewCell else { fatalError() }
            
            cell.header.text = indexPath.row == 0 ? "Email" : "Password"
            
            return cell

        case 2:      
            
            switch indexPath.row{
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(LoginFormSignInCell.self)", for: indexPath) as? LoginFormSignInCell else { fatalError() }

                return cell
                
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(LoginFormSignUpCell.self)", for: indexPath) as? LoginFormSignUpCell else { fatalError() }

                return cell

                
            default: fatalError()
            }

        default: fatalError()
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
