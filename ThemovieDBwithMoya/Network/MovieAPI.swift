//
//  MovieAPI.swift
//  ThemovieDBwithMoya
//
//  Created by TeddyKwak on 2020/07/27.
//  Copyright © 2020 TeddyKwak. All rights reserved.
//

import Foundation
import Moya

enum MovieAPI {
    case reco(id: Int)
    case topRated(page: Int)
    case newMovies(page: Int)
    case video(id: Int)
}

extension MovieAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/") else { fatalError("baseURL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .reco(let id):
            return "\(id)/recommendations"
        case .topRated:
            return "popular"
        case .newMovies:
            return "now_playing"
        case .video(let id):
            return "\(id)/videos"
        }
    }
    
    
    var method: Moya.Method {
        switch self {
        case .reco(_), .topRated(_), .newMovies(_), .video(_):
            return .get
        }
    }
    
    
    
    var sampleData: Data {
        switch self {
        case .reco(_), .topRated, .newMovies, .video(_):
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .reco(_), .video(_):
            return .requestParameters(parameters: ["api_key": API.apiKey], encoding: URLEncoding.queryString)
        case .topRated(let page), .newMovies(let page):
            return .requestParameters(parameters: ["api_key": API.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
