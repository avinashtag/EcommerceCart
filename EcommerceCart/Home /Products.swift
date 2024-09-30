//
//  Products.swift
//  EcommerceCart
//
//  Created by Avinash on 17/09/2024.
//

import Foundation


public enum Products{
    
    struct Request : Codable{
         
        public func load() async throws -> [Product]{
            
            //Load Data form local json file

            //Load with Extesion
            let products : [Product] = try Bundle.main.decodeJson(resourceName: "Products", extensionName: "json")
            return products
            
//            guard let url =  Bundle.main.url(forResource: "Products", withExtension: "json") else { throw  ErrorResponse.requestFailed }
//            let data = try Data(contentsOf: url)
//            let result = try JSONDecoder().decode([Product].self, from: data)
//            return result

            //Calling the API
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
