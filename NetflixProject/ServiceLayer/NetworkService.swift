//
//  NetworkService.swift
//  NetflixProject
//
//  Created by u633174 on 28/10/2022.
//

import Foundation

import Moya

public enum TheMovieDBAPI {
    case movieslist
    case tvshows
    case movieUpComing
//    case actorpopular
//    case searchMovie(search: String?)
//    case moviesReviews(Int)
    
}

extension TheMovieDBAPI {
    var apiKey: String {
        return "627e3f67dac2c73e662093fe66b67ce7"
    }
}

extension TheMovieDBAPI: TargetType {

    public var baseURL: URL { return URL(string: "https://api.themoviedb.org/3")! }

    public var path: String {
        switch self {
        case .movieslist:
            return "/movie/popular"
        case .tvshows:
            return "/trending/tv/day"
        case .movieUpComing:
            return "/movie/upcoming"
//        case .actorpopular:
//            return "/person/popular"
//        case .moviesReviews(let id):
//            return "/movie/\(id)/reviews"
//        case .searchMovie(search: _):
//            return "/search/movie"
        
        }
    }

    public var method: Moya.Method {
        switch self {
        case .movieslist, .tvshows, .movieUpComing:
//            , .searchMovie(search: _), .actorpopular, .moviesReviews,
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .movieslist, .tvshows, .movieUpComing:
//            , .actorpopular, .moviesReviews, .tvshows:
            return .requestParameters(parameters: ["api_key": apiKey], encoding: URLEncoding.default)
//        case .searchMovie(search: let search):
//            return .requestParameters(parameters: ["api_key": apiKey, "query": search!], encoding: URLEncoding.default)
        }
    }

    public var headers: [String: String]? {
        return [:]
    }

    public var sampleData: Data {
        switch self {
        case .movieslist, .tvshows, .movieUpComing:
//            , .searchMovie(search: _), .actorpopular, .moviesReviews,
            return ("{}".data(using: String.Encoding.utf8)! as NSData) as Data
        }
    }
}
