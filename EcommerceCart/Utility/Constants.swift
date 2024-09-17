//
//  Constants.swift
//  C4W
//
//  Created by Avinash  Tag on 17/1/23.
//

import Foundation

enum HTTPMethod : String {
    case POST = "POST"
    case PUT = "PUT"
    case DEL = "DELETE"
    case GET = "GET"
}

enum APICalls: String {
    case products = "products"
}

struct APIContent{
    static let type = "Content-Type"
    static let json = "application/json"
}

struct Constants{
    
}
