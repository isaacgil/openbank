//
//  APIManager.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

class APIManager{
    static var singleton:APIManager? = nil
    
    private let executor = URLSessionExecutor()
    private let endpoint = "https://gateway.marvel.com:443/v1/public/"
    private let publicKey = "439b9f7613a16f464f7ee530b11cce9a"
    private let privateKey = "a73887a487cb2c03e4a49234280265b5e141e65d"

    public enum MarvelRequest: String {
        case characters
        case comics
        case creators
        case events
        case series
        case stories
    }
    
    static public func instance() -> APIManager {
        if (singleton == nil){
            singleton = APIManager()
        }
        
        return singleton!
    }
    
    public func getCharacters(offset: Int? = 0, characterId:String? = nil, completion: @escaping (CharacterDataContainer?) -> Void){
     
        let ts = NSDate().timeIntervalSince1970
        let md5 = "\(ts)\(privateKey)\(publicKey)".MD5()
        var req = endpoint
        req += "\(MarvelRequest.characters.rawValue)"
        if let characterId = characterId {
            req += "/\(characterId)"
        }
        req += "?apikey=\(publicKey)"
        req += "&ts=\(ts)"
        req += "&hash=\(md5)"
        
        if let offset = offset {
            req += "&offset=\(offset)"
        }
        
        executor.request(req: req, params: nil) { data, error in
            var wrapper: CharacterDataWrapper? = nil
            if let data = data as? Data{
                do {
                    wrapper = try CharacterDataWrapper(data: data)
                }
                catch let err {
                    print(err)
                    
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            //API notify the error
                            print(json)
                        }
                    } catch let err {
                        print(err)
                    }
                    
                }
            }
            
            guard let wrapper = wrapper else {
                completion(nil)
                return
            }
            
            if wrapper.code != 200 {
                print(wrapper)
                completion(nil)
                return
            }
            
            completion(wrapper.data)
        }
    }

}
