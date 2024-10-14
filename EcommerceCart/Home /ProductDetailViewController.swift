//
//  ProductDetailViewController.swift
//  EcommerceCart
//
//  Created by Bhavya on 25/09/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var rating: UILabel!
  
    var product: ProductDataEntity?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let receivedProduct = product {
          
            if let imageUrl = URL(string: receivedProduct.imageURL ?? "") {
                productImage.loadImage(from: imageUrl)
            }
            productTitle.text = receivedProduct.title
            productDescription.text = receivedProduct.productDescription
            price.text = "$\(receivedProduct.price)"
            category.text = receivedProduct.category
            rating.text = "\(String(receivedProduct.rating?.rate ?? 0))/\(String(receivedProduct.rating?.count ?? 0))"
            
        }else{
            fatalError()
        }
        
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */

}
