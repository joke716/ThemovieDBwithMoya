//
//  API.swift
//  ThemovieDBwithMoya
//
//  Created by TeddyKwak on 2020/07/27.
//  Copyright © 2020 TeddyKwak. All rights reserved.
//

import Foundation
import Moya

class API {
    
    static let apiKey = "8597e491ed6e80f0de12e349eb60ea6e"
    static let provider = MoyaProvider<MovieAPI>()
    static let decoder = JSONDecoder()
    
    static func getNewMovie(page: Int, completion: @escaping ([Movie]) -> ()) {
        provider.request(.newMovies(page: page)) { (result) in
            switch result {
            case .success(let response):
                
                do {
                    
                    let results = try decoder.decode(APIResults.self, from: response.data)
                    completion(results.movies)
                } catch let err {
                    print(err)
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    static func getTopTated(page: Int, completion: @escaping ([Movie]) -> ()) {
        provider.request(.topRated(page: page)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let results = try decoder.decode(APIResults.self, from: response.data)
                    completion(results.movies)
                } catch let err {
                    print(err)
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    
    static func getRecommendations(forMovieWith id: Int, completion: @escaping ([Movie]?)->()){
        provider.request(.reco(id: id)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let results = try decoder.decode(APIResults.self, from: response.data)
                    completion(results.movies)
                }catch let err{
                    print(err)
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    
}
