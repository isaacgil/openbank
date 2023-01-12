//
//  ComicList.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

// MARK: - ComicList
struct ComicList: Codable
{
    let available: Int? //(int, optional): The number of total available issues in this list. Will always be greater than or equal to the "returned" value.,
    let returned: Int? //(int, optional): The number of issues returned in this collection (up to 20).,
    let collectionURI: String? //(string, optional): The path to the full list of issues in this collection.,
    let items: [ComicSummary]? //(Array[ComicSummary], optional): The list of returned issues in this collection.

}

// MARK: ComicList convenience initializers and mutators
extension ComicList {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            ComicList.self, from: data)
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

