//
//  Url.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

// MARK: - Url
struct Url: Codable
{
    let type: String? //(string, optional): A text identifier for the URL.,
    let url: String? // (string, optional): A full URL (including scheme, domain, and path).

}

// MARK: Url convenience initializers and mutators
extension Url {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            Url.self, from: data)
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

