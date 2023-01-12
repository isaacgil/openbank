//
//  UIImageView+Url.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 12/1/23.
//

import Foundation
import CryptoKit

extension String {
    func MD5() -> String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}

