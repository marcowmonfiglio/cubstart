//
//  ArticleEndpoint.swift
//  newsfeedSkeleton
//
//  Created by Marco Monfiglio on 4/3/22.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
}

enum ArticleAPI {
    case getNews
}

extension ArticleAPI: APIBuilder {
    
    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: "https://lil.software/api/")!
        }
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "/news"
        }
    }
    
    var urlRequest: URLRequest {
        switch self {
        case .getNews:
            return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
        }
    }
}
