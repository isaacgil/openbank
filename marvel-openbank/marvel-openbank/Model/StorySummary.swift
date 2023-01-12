//
//  StorySummary.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

// MARK: - StorySummary
struct StorySummary: Codable
{
    let resourceURI: String? //  (string, optional): The path to the individual story resource.,
    let name: String? //  (string, optional): The canonical name of the story.,
    let type: String? //  (string, optional): The type of the story (interior or cover).

}

// MARK: StorySummary convenience initializers and mutators
extension StorySummary {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            StorySummary.self, from: data)
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

