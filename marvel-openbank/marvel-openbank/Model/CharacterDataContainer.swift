//
//  CharacterDataContainer.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

// MARK: - CharacterDataContainer
struct CharacterDataContainer: Codable
{
    let offset: Int? //(int, optional): The requested offset (number of skipped results) of the call.,
    let limit: Int? //(int, optional): The requested result limit.,
    let total: Int? //(int, optional): The total number of resources available given the current filter set.,
    let count: Int? //(int, optional): The total number of results returned by this call.,
    let results: [Character]? // (Array[Character], optional): The list of characters returned by the call.
}

// MARK: CharacterDataContainer convenience initializers and mutators
extension CharacterDataContainer {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            CharacterDataContainer.self, from: data)
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
