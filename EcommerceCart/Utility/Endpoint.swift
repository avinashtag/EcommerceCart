//
//  Endpoint.swift
//  C4W
//
//  Created by Avinash  Tag on 17/1/23.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryParams: [URLQueryItem] { get set }
}

extension APICalls: Endpoint {
    
    struct Keeper { static var _queryParams:[URLQueryItem] = [URLQueryItem]() }
    
    var queryParams: [URLQueryItem] {
        get { return Keeper._queryParams }
        set (newValue) { Keeper._queryParams = newValue }
    }
    
    var base: String { return  "https://fakestoreapi.com" }
    var path: String { return self.rawValue }
}


class Network: NSObject, URLSessionTaskDelegate {
    
    static let shared = Network()
    var query: [URLQueryItem]?
    var urlSession: URLSession = URLSession.shared
       

    func fetch<T: Decodable>(for call: APICalls, method: HTTPMethod? = .GET, body: Encodable? = nil)async throws-> T  {
        
        guard var components = URLComponents(string: call.base) else { throw ErrorResponse.endpointInvalid }
        components.path = "/\(call.path)"
        components.queryItems = query
        
        let url = components.url!
        var request = URLRequest(url: url)
        var headers = request.allHTTPHeaderFields ?? [:]
        request.allHTTPHeaderFields = headers
        request.cachePolicy = request.httpMethod == HTTPMethod.GET.rawValue ? .reloadRevalidatingCacheData : .reloadIgnoringCacheData
        request.setValue(APIContent.json, forHTTPHeaderField:APIContent.type)
        request.httpMethod = method?.rawValue ?? HTTPMethod.GET.rawValue
        if let body = body{ request.httpBody = try JSONEncoder().encode(body) }
        let (responseData, urlResponse) = try await urlSession.data(for: request, delegate: self)
        
        let response = try JSONDecoder().decode(T.self, from: responseData)
        
#if DEBUG
        print("<URL:><\(url.absoluteString)>\n<Headers:><\(headers)>\n")
        if let body = request.httpBody{
            let b = String(data: body, encoding: .utf8)?.replacingOccurrences(of: "\\", with: "")
            print("<Body:><\(b ?? "NULL")>\n")
        }
        let f = String(data: responseData, encoding: .utf8)?.replacingOccurrences(of: "\\", with: "")
        print("<Response:><\(f ?? "NULL")>")
#endif
        
        return response
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

         guard let serverTrust = challenge.protectionSpace.serverTrust,
         let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0)
         else { completionHandler(.performDefaultHandling, nil); return }

         let policy = NSMutableArray()
         policy.add(SecPolicyCreateSSL(true, challenge.protectionSpace.host as CFString))

         let isServerTrusted = SecTrustEvaluateWithError(serverTrust, nil)

         let remoteCertificateData: NSData = SecCertificateCopyData (certificate)

 //        let pathToCertificate = Bundle.main.path(forResource: "certificate", ofType: "cer")
 //        let localCertificateData: NSData = NSData.init (contentsOfFile: pathToCertificate!)!
 //        && remoteCertificateData.isEqual (to: localCertificateData as Data)
         if (isServerTrusted ) {

             let credential: URLCredential = URLCredential(trust: serverTrust)
             completionHandler (.useCredential, credential)
             print( "Certification pinning is successfull")
         }
         else{
             completionHandler(.cancelAuthenticationChallenge, nil)
         }


         // Pinning failed completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, nil)
     }

    
}
