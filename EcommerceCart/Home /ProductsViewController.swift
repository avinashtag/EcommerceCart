//
//  ProductsViewController.swift
//  EcommerceCart
//
//  Created by Avinash on 21/09/2024.
//

import UIKit

class ProductCell: UITableViewCell{
    
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

class ProductsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var products: [Products.Product]?
    
    var myqueue: DispatchQueue = DispatchQueue(label: "Aswini", qos: .background)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Try pu this function on background thread
        
        myqueue.async {
            self.fetchProducts()// 2 min
        }
        
        DispatchQueue.global().async {
            
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

extension ProductsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductCell.self)") as? ProductCell , let product = products?[indexPath.row] else {
            fatalError()
        }
        
//        cell.productImage.image = product.image // find how to load url in imageview *3rd party as well but try native way
        cell.productTitle.text = product.title
        cell.productDescription.text = product.description
        cell.productPrice.text = "$ \(product.price)"
        return cell
    }
    
    
}

//API Calls
extension ProductsViewController{
    
    func fetchProducts(){
        Task{
            do{
                products = try await Products.Request().load()
                //Always call UI on main thread
                //Switch to main thread
                //****GCD- Grand Central Dispatch - Read on developer.apple ?****
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            catch{
                print(error)
            }
        }
    }
}

