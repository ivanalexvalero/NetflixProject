//
//  RequestModel.swift
//  NetflixProject
//
//  Created by Ivan Valero on 22/09/2022.
//

import Foundation

struct RequestModel  {
    let endpoint : Endpoints
    var queryItems : [String:String]?
    let httpMethod : HttpMethod = .GET
    var baseUrl : URLBase = .movieDB
    
    func getURL() -> String{
        return baseUrl.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod : String{
        case GET
        case POST
    }

    enum Endpoints : String   {
        case trendingAll = "/3/trending/all/day"
//        case channels = "/channels"
//        case playlist = "/playlists"
//        case playlistItems = "/playlistItems"
//        case videos = "/videos"
        case empty = ""
    }

    enum URLBase : String{
        case movieDB = "https://api.themoviedb.org"
    }
}
