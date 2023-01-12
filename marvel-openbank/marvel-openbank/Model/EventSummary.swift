//
//  EventSummary.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

// MARK: - EventSummary
struct EventSummary: Codable
{
    let resourceURI: String? //  (string, optional): The path to the individual event resource.,
    let name: String? //  (string, optional): The name of the event.

}

// MARK: EventSummary convenience initializers and mutators
extension EventSummary {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            EventSummary.self, from: data)
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

