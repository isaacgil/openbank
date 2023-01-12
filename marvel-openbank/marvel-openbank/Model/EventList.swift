//
//  EventList.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

// MARK: - EventList
struct EventList: Codable
{
    let available: Int? //(int, optional): The number of total available events in this list. Will always be greater than or equal to the "returned" value.,
    let returned: Int? //(int, optional): The number of events returned in this collection (up to 20).,
    let collectionURI: String? //(string, optional): The path to the full list of events in this collection.,
    let items: [EventSummary]? //(Array[EventSummary], optional): The list of returned events in this collection.

}

// MARK: EventList convenience initializers and mutators
extension EventList {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            EventList.self, from: data)
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

