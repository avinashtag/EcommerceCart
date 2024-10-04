//
//  Products.swift
//  EcommerceCart
//
//  Created by Avinash on 17/09/2024.
//

import Foundation
import CoreData
import UIKit


public enum Products{
    
    struct Request : Codable{
        
        public func load() async throws -> [Product]{
            
#if DEBUG
            return try Bundle.main.decoder("Products.json", of: [Product].self)
#endif
            
            let response: [Product] = try await Network.shared.fetch(for: .products)
            return response
        }
        
        public func loadWithCategory() async throws -> [Product]{
            
#if DEBUG
            return try Bundle.main.decoder("Products.json", of: [Product].self)
#endif
            
            
            let response: [Product] = try await Network.shared.fetch(for: .products)
            return response
        }
        
    }
    
    
    struct Product: Codable {
        let id: Int
        let title: String
        let price: Double
        let description: String
        let category: Category
        let image: String
        let rating: Rating
    }
    
    enum Category: String, Codable {
        case electronics = "electronics"
        case jewelery = "jewelery"
        case menSClothing = "men's clothing"
        case womenSClothing = "women's clothing"
    }
    
    // MARK: - Rating
    struct Rating: Codable {
        let rate: Double
        let count: Int
    }
    
}

extension Products.Product {
    
    // Convert Product struct to Core Data Product entity
    func toCoreDataProduct(context: NSManagedObjectContext) -> ProductDataEntity {
        let coreDataProduct = ProductDataEntity(context: context)
        coreDataProduct.id = Int64(self.id)
        coreDataProduct.title = self.title
        coreDataProduct.price = self.price
        coreDataProduct.productDescription = self.description
        coreDataProduct.category = self.category.rawValue
        coreDataProduct.imageURL = self.image
        
        let rating = RatingDataEntity(context: context)
        rating.rate = self.rating.rate
        rating.count = Int64(self.rating.count)
        
        coreDataProduct.rating = rating
        return coreDataProduct
    }
    
    // Create a Product struct from Core Data Product entity
    init(from coreDataProduct: ProductDataEntity) {
        self.id = Int(coreDataProduct.id)
        self.title = coreDataProduct.title ?? ""
        self.price = coreDataProduct.price
        self.description = coreDataProduct.productDescription ?? ""
        self.category = Products.Category(rawValue: coreDataProduct.category ?? "") ?? .electronics
        self.image = coreDataProduct.imageURL ?? ""
        self.rating = Products.Rating(rate: coreDataProduct.rating!.rate, count: Int(coreDataProduct.rating!.count))
    }
}
