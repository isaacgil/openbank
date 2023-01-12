//
//  CharacterDataWrapper.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

// MARK: - CharacterDataWrapper
struct CharacterDataWrapper: Codable
{
    let code: Int? // (int, optional): The HTTP status code of the returned result.,
    let status: String? // (string, optional): A string description of the call status.,
    let copyright: String? // (string, optional): The copyright notice for the returned result.,
    let attributionText: String? // (string, optional): The attribution notice for this result. Please display either this notice or the contents of the attributionHTML field on all screens which contain data from the Marvel Comics API.,
    let attributionHTML: String? //(string, optional): An HTML representation of the attribution notice for this result. Please display either this notice or the contents of the attributionText field on all screens which contain data from the Marvel Comics API.,
    let data: CharacterDataContainer? // (CharacterDataContainer, optional): The results returned by the call.,
    let etag: String? //(string, optional): A digest value of the content returned by the call.
        
}

// MARK: CharacterDataWrapper convenience initializers and mutators
extension CharacterDataWrapper {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            CharacterDataWrapper.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(
                domain: "JSONDecoding",
                code: 0,
                userInfo: nil)
        }

        try self.init(data: data)
    }
}
