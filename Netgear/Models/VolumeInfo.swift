//
//  VolumeInfo.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 14/07/2025.
//

import Foundation

struct VolumeInfo: Codable, Hashable {
    
    let title: String
    let description: String?
    let authors: [String]?
    let imageLinks: ImageLinks?
    let pageCount: Int?
    let categories: [String]?
    let publishedDate: String?
    
    init(
        title: String,
         description: String? = nil,
         authors: [String]? = nil,
         imageLinks: ImageLinks? = nil,
         pageCount: Int? = nil,
         categories: [String]? = nil,
         publishedDate: String? = nil
    ) {
        self.title = title
        self.description = description
        self.authors = authors
        self.imageLinks = imageLinks
        self.pageCount = pageCount
        self.categories = categories
        self.publishedDate = publishedDate
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case authors
        case imageLinks
        case pageCount
        case categories
        case publishedDate
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        title = try container.decode(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)

        // Merge authors array into a comma-separated string
        authors = try container.decodeIfPresent([String].self, forKey: .authors)

        // Merge categories array into a comma-separated string
        categories = try container.decodeIfPresent([String].self, forKey: .categories)

        imageLinks = try container.decodeIfPresent(ImageLinks.self, forKey: .imageLinks)
        pageCount = try container.decodeIfPresent(Int.self, forKey: .pageCount)
        publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate)
    }
}
