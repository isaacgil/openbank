//
//  StoryList.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

// MARK: - StoryList
struct StoryList: Codable
{
    let available: Int? //(int, optional): The number of total available stories in this list. Will always be greater than or equal to the "returned" value.,
    let returned: Int? //(int, optional): The number of stories returned in this collection (up to 20).,
    let collectionURI: String? //(string, optional): The path to the full list of stories in this collection.,
    let items: [StorySummary]? //(Array[StorySummary], optional): The list of returned stories in this collection.

}

// MARK: StoryList convenience initializers and mutators
extension StoryList {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            StoryList.self, from: data)
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

