//
//  Bundle+Extension.swift
//  EcommerceCart
//
//  Created by Avinash on 30/09/2024.
//

import Foundation

extension Bundle{
    
    func decodeJson<T: Decodable>( resourceName: String, extensionName: String)throws -> T{
        guard let url =  Bundle.main.url(forResource: resourceName, withExtension: extensionName) else { throw  ErrorResponse.requestFailed }
        let data = try Data(contentsOf: url)
        let result = try JSONDecoder().decode(T.self, from: data)
        return result

    }
}
