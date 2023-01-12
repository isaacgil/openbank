//
//  Image.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 11/1/23.
//

import Foundation

// MARK: - Image
struct Image: Codable
{
    let path: String? //(string, optional): The directory path of to the image.,
    let `extension`: String? //(string, optional): The file extension for the image.

}

// MARK: Image convenience initializers and mutators
extension Image {
    init(data: Data) throws {
        self = try JSONDecoder().decode(
            Image.self, from: data)
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
    
    public func getUrl() -> String? {
        guard let path = path, let ext = `extension` else {
            return nil
        }
        
        return "\(path).\(ext)"
    }
}

