//
//  UIImageView+Url.swift
//  marvel-openbank
//
//  Created by Isaac Gil de Avalle Munoz on 12/1/23.
//

import UIKit

extension UIImageView {
    func load(url: String?) {
        self.image = nil
        let secureUrl = url?.replacingOccurrences(of: "http://", with: "https://")
        guard let url = secureUrl, let lUrl = URL(string:url) else {
            return;
        }
        
        self.load(url:lUrl)
        
    }
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

