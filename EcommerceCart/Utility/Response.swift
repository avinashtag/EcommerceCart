//
//  Response.swift
//  C4W
//
//  Created by Avinash  Tag on 17/1/23.
//

import Foundation

enum APIResponse<T, U> where U: Error  {
    case success(T, Int)
    case failure(U)
}

enum ErrorResponse: Error, Equatable {
    static func == (lhs: ErrorResponse, rhs: ErrorResponse) -> Bool {
        return lhs.code == rhs.code
    }
    
   
    case requestFailed
    case invalidData(Int)
    case unsuccessful(String, Int)
    case jsonConversionFailure(String, Int)
    case jsonParsingFailure(Int)
    case noNetwork(Int)
    case notFound(Int) // just to handle user deactivated
    case unAuthorised(Int)
    case unSpecified(String, Int)
    case uploadFailed(String, Any)
    case syncURLNotFound
    case coreDataFailed(String, Int)
    case ready
    case zeroData
    case waiting
    case encoding
    case deviceToken
    case trialEnded
    case endpointInvalid
    case incompatibleDevice
    case localCompatibleDevice
    case cameraNotSupported


    var localizedDescription: String {
        switch self {
        case .requestFailed: return  "Request Failed"
        case .invalidData( _): return "Invalid Data"
        case let .unsuccessful (message, _): return "\(message)"
        case let .jsonConversionFailure(message, _): return  message
        case .jsonParsingFailure( _): return "Something went wrong"
        case .noNetwork( _): return "The Internet connection appears to be offline"
        case .notFound ( _) : return  "Something went wrong"
        case .unAuthorised ( _) : return  " Access blocked."
        case let .unSpecified(message, _): return "\(message)"
        case let .uploadFailed(message, _): return "\(message)"
        case .syncURLNotFound: return "URL Not Found"
        case let .coreDataFailed(message, _): return message
        case .ready: return ""
        case .zeroData : return "Empty Data"
        case .waiting : return "Waiting"
        case .encoding: return "Unable to encode the request."
        case .deviceToken: return "Device token not found."
        case .trialEnded: return "Your trial period expired, please contact your administrator or configure again."
        case .endpointInvalid: return "Please configure your app, if issue persist please contact your administrator."
        case .incompatibleDevice, .localCompatibleDevice: return "Incompatible device, please configure your app, if issue persist please contact your administrator."
        case .cameraNotSupported: return "DualLensError"
        }
    }
    
    var code: Int{
        
        switch self {
        case .requestFailed: return  400
        case let .invalidData(e): return e
        case let .unsuccessful (_, e): return e
        case let .jsonConversionFailure(_, e): return  e
        case let .jsonParsingFailure( e): return e
        case let .noNetwork( e): return e
        case let .notFound ( e) : return  e
        case let .unAuthorised ( e) : return  e
        case let .unSpecified(_, e): return e
        case .uploadFailed(_, _): return 100
        case .syncURLNotFound: return 90
        case let .coreDataFailed(_, code): return code
        case .ready: return 0
        case .zeroData: return 0
        case .waiting: return 0
        case .encoding: return 0
        case .deviceToken: return 11
        case .trialEnded: return 701
        case .endpointInvalid: return 702
        case .incompatibleDevice: return 703
        case .localCompatibleDevice: return 704
        case .cameraNotSupported: return 705

        }
    }
}
