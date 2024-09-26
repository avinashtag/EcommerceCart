//
//  HomeViewController.swift
//  EcommerceCart
//
//  Created by Bhavya on 17/09/24.
//

import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    private var products: [Products.Product]?
    
    var selectedProduct: Products.Product?
    
    var myqueue: DispatchQueue = DispatchQueue(label: "Bhavya", qos: .background)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationbarButtons()
        addSearchBar()
        
        //collectionView
        homeCollectionView.collectionViewLayout = createCollectionLayout()
        homeCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        homeCollectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerIdentifier")
        
        // Set the delegate and data source
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        myqueue.async {
            self.fetchProducts()// 2 min
        }
        
        
        
    }
    
    // Prepare for the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "\(ProductDetailViewController.self)Segue" {
            // Get the destination view controller
            if let destinationVC = segue.destination as? ProductDetailViewController{
                // Pass the selected object to the destination view controller
                destinationVC.product = selectedProduct
            }
        }
    }

    
    
    func addNavigationbarButtons(){
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.view.backgroundColor = UIColor.accent
        self.title = "Home"
        
        //Navigation bar buttons
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(openSideMenu))
        self.navigationItem.leftBarButtonItem = menuButton
        let notificationButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(openNotifications))
        self.navigationItem.rightBarButtonItem = notificationButton
    }
    
    func addSearchBar() {
        //SearchBar
        searchBar.placeholder = "Search"
        searchBar.borderStyle = .roundedRect
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.clearButtonMode = .whileEditing
        // To Add rounded corners
        searchBar.layer.cornerRadius = 10
        searchBar.clipsToBounds = true
        
        //To add search Icon
        let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.tintColor = .gray // Optional: Set the icon color
        searchIcon.frame = CGRect(x: 0, y: 0, width: 24, height: 24) // Set the size of the icon
        // to add padding to the icon
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 24)) // Adjust width for padding
        leftPaddingView.addSubview(searchIcon)
        searchIcon.center = leftPaddingView.center
        
        // Add the search icon to the left view
        searchBar.leftView = leftPaddingView
        searchBar.leftViewMode = .always
        
        //To add filter Icon
        
        let filterButton = UIButton(type: .system)
        filterButton.setImage(UIImage(systemName: "line.horizontal.3.decrease.circle"), for: .normal) // Filter icon
        filterButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        
        //To add padding to icon
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 24)) // Adjust width for padding
        rightPaddingView.addSubview(filterButton)
        filterButton.center = rightPaddingView.center
        
        // Add the filter button to the right view
        searchBar.rightView = rightPaddingView
        searchBar.rightViewMode = .always
        
        //Elevated effect for search bar
        searchBar.layer.cornerRadius = 20 // Adjust to your preferred corner radius
        searchBar.layer.masksToBounds = false
        
        searchBar.layer.shadowColor = UIColor.black.cgColor
        searchBar.layer.shadowOpacity = 0.5 // More prominent shadow
        searchBar.layer.shadowOffset = CGSize(width: 0, height: 4) // Larger offset
        searchBar.layer.shadowRadius = 6 // More blur to the shadow
        
        
    }
    
    @objc func filterButtonTapped(){
        //TODO open filter page
    }
    @objc func openNotifications(){
        //TODO navigate to notifications page
    }
    @objc func openSideMenu() {
        // TODO open Side bar menu
    }
    
    
}
extension HomeViewController {
    private func createCollectionLayout() -> UICollectionViewLayout{
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            if sectionIndex == 0 {
                // First Section: One full-width cell
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .absolute(200))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                return section
                
            } else {
                // Other Sections: Horizontally scrolling square cells
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),
                                                      heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .absolute(200)) // Same height as first section
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0: return products?.count ?? 0 > 0 ? 1 : 0
        default: return products?.count ?? 0
        } //later this will be based on the api call.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell, let product = products?[indexPath.row] else {
            fatalError()
        }
        
        // Configure the cell with title, price, and imageURL (dummy URLs here)
        let imageURL = URL(string: product.image) // Replace with real URL from your API
        cell.configureCell(with: imageURL, title: product.title, price: "$\(product.price)")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerIdentifier", for: indexPath) as! SectionHeaderView
            headerView.titleLabel.text = "Section \(indexPath.section + 1)"
            return headerView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Get the selected object
        selectedProduct = products?[indexPath.row]
        
        // Perform the segue to the next view controller
        performSegue(withIdentifier: "\(ProductDetailViewController.self)Segue", sender: self)
    }
    
    
    
}

extension HomeViewController{
    
    func fetchProducts(){
        Task{
            do{
                products = try await Products.Request().load()
                //Always call UI on main thread
                //Switch to main thread
                //****GCD- Grand Central Dispatch - Read on developer.apple ?****
                
                DispatchQueue.main.async {
                    self.homeCollectionView.reloadData()
                }
                
            }
            catch{
                print(error)
            }
        }
    }
}


/*
 
 navigation bar appearance
 1. Color
 2. add button in searchbar instead of textfield : subclass add in views
 */

