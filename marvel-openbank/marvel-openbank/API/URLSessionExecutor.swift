//
//  URLSessionExecutor.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 12/1/23.
//

import Foundation

public typealias CompletionClosure =  ((Any?, Error?) -> Void)

class URLSessionExecutor:NSObject{
    public enum HTTPMethods: String {
        case GET
        case HEAD
        case POST
        case PUT
        case DELETE
        case CONNECT
        case OPTIONS
        case TRACE
        case PATCH
    }
    
    private var session: URLSession?
    private var configuration = URLSessionConfiguration.default
    
    init(timeout: TimeInterval = 300, useCache: Bool = false) {
        super.init()
        
        if timeout > 0 {
            configuration.timeoutIntervalForRequest = min(max(timeout,0), 300)
        }
        
        if useCache == false {
            configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
            configuration.urlCache = nil
        } else {
            configuration.requestCachePolicy  = .useProtocolCachePolicy
        }
        
        self.session = URLSession(configuration: configuration)
    }
    
    func request(req: String,
                 methodHTTP: HTTPMethods = .GET,
                    params: [String: Any]?,
                    headers: [String: String]? = nil,
                    completion: @escaping CompletionClosure) {
        
        guard let url = URL(string: req) else {
            completion(nil, NSError(domain: "marvel-openbank", code: -1))
            return
        }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = methodHTTP.rawValue
        request.allHTTPHeaderFields = headers
        
        if let params = params {
            do {
               request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
                completion(nil, error)
                return
            }
        }
        
        let task = self.session?.dataTask(with: request) {(data, response, error) in
            
            guard let content = data, let _ = response as? HTTPURLResponse else {
                print(error ?? "undefined error")
                completion(nil, error)
                return
            }
            
            if let error = error {
                print(error)
                completion(nil, error)
                return
            }
            
            completion(content, nil)
        }

        task?.resume()
    }
    

}
