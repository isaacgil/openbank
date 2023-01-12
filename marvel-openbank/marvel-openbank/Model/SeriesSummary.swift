//
//  SeriesSummary.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

// MARK: - SeriesSummary
struct SeriesSummary: Codable
{
    let resourceURI: String? //  (string, optional): The path to the individual series resource.,
    let name: String? //  (string, optional): The canonical name of the series.

}

// MARK: SeriesSummary convenience initializers and mutators
extension SeriesSummary {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            SeriesSummary.self, from: data)
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

