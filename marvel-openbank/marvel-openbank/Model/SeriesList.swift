//
//  SeriesList.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

// MARK: - SeriesList
struct SeriesList: Codable
{
    let available: Int? //(int, optional): The number of total available series in this list. Will always be greater than or equal to the "returned" value.,
    let returned: Int? //(int, optional): The number of series returned in this collection (up to 20).,
    let collectionURI: String? //(string, optional): The path to the full list of series in this collection.,
    let items: [SeriesSummary]? //(Array[SeriesSummary], optional): The list of returned series in this collection.

}

// MARK: SeriesList convenience initializers and mutators
extension SeriesList {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            SeriesList.self, from: data)
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

