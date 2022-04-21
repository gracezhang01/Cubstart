//
//  Article.swift
//  newsfeedSkeleton
//
//  Created by Grace Zhang on 4/7/22.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ArticleResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable{
    
    let id: UUID = UUID()
    let author: String?
    let url: String
    let source, title: String
    let articleDescription: String?
    let image: String?
    let date: Date

        enum CodingKeys: String, CodingKey {
            case author, url, source, title
            case articleDescription = "description"
            case image, date
    }
    
}

