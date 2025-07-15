//
//  Book.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 14/07/2025.
//

import Foundation

struct Book: Codable, Identifiable, Hashable {
    var id: String
    let volumeInfo: VolumeInfo
}
