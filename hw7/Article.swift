//
//  Article.swift
//  newsfeedSkeleton
//
//  Created by Marco Monfiglio on 4/3/22.
//

import Foundation
struct ArticleResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    
    let id: UUID = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

