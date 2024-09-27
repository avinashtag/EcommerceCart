//
//  SearchViewController.swift
//  EcommerceCart
//
//  Created by Bhavya on 27/09/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Access the search bar's text field
        if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
            
            if let searchIcon = UIImage(systemName: "magnifyingglass.circle.fill") {
                searchBar.setImage(searchIcon, for: .search, state: .normal)
            }
            
            // Customize the clear button icon
            if let clearIcon = UIImage(systemName: "xmark.circle.fill") {
                searchBar.setImage(clearIcon, for: .clear, state: .normal)
            }
            
            
            // Remove the existing right view (microphone button)
            searchTextField.rightView = nil
            
            // Create a new filter button
            let filterButton = UIButton(type: .custom)
            filterButton.setImage(UIImage(systemName: "line.horizontal.3.decrease.circle"), for: .normal)
            filterButton.tintColor = .systemBlue // Set the button color
            filterButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30) // Adjust size as needed
            filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
            
            // Set the filter button as the new right view of the search text field
            searchTextField.rightView = filterButton
            searchTextField.rightViewMode = .always
        }else {
            fatalError()
        }
    }
    // Action for when the filter button is tapped
    @objc func filterButtonTapped() {
        print("Filter button tapped")
        // Implement your filter functionality here
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
