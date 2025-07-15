//
//  String+.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 14/07/2025.
//

import Foundation

extension String {
    var asSecureURL: URL? {
        let urlString = replacingOccurrences(of: "http:", with: "https:")
        return URL(string: urlString)
    }
}
