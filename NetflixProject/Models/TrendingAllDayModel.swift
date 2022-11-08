//
//  TrendingAllDayModel.swift
//  NetflixProject
//
//  Created by Ivan Valero on 22/09/2022.
//

import Foundation

struct TrendingAllDayModel: Decodable {
    let page: Int
    let results: [TrendingAllDayModel.Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    // MARK: - Result
    struct Result: Decodable {
        let id: Int?
        let name: String?
//        let originalLanguage: String?
        let originalName: String?
//        let overview,
        let posterPath: String?
//        let mediaType: MediaType?
//        let genreIDS: [Int]?
//        let popularity: Double?
//        let firstAirDate: String?
//        let voteAverage: Double?
//        let voteCount: Int?
//        let originCountry: [String]?
        let originalTitle: String?
//        let title, originalTitle, releaseDate: String?
//        let video: Bool?

        enum CodingKeys: String, CodingKey {
            case id
            case name
//            case originalLanguage = "original_language"
            case originalName = "original_name"
//            case overview
            case posterPath = "poster_path"
//            case mediaType = "media_type"
//            case genreIDS = "genre_ids"
//            case popularity
//            case firstAirDate = "first_air_date"
//            case voteAverage = "vote_average"
//            case voteCount = "vote_count"
//            case originCountry = "origin_country"
//            case title
            case originalTitle = "original_title"
//            case releaseDate = "release_date"
//            case video
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
      
            if let id = try? container.decode(Int.self, forKey: .id){
                self.id = id
            }else {
                self.id = nil
            }
            
            if let name = try? container.decode(String.self, forKey: .name){
                self.name = name
            }else {
                self.name = nil
            }
            
            if let originalName = try? container.decode(String.self, forKey: .originalName){
                self.originalName = originalName
            }else {
                self.originalName = nil
            }
            
            if let posterPath = try? container.decode(String.self, forKey: .posterPath){
                self.posterPath = posterPath
            }else {
                self.posterPath = nil
            }
            
            if let originalTitle = try? container.decode(String.self, forKey: .originalTitle){
                self.originalTitle = originalTitle
            }else {
                self.originalTitle = nil
            }
        }
        
        
        
        
//        enum MediaType: String, Codable {
//            case movie = "movie"
//            case tv = "tv"
//        }
        
    }
}




