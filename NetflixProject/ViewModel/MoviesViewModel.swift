//
//  MoviesViewModel.swift
//  NetflixProject
//
//  Created by u633174 on 28/10/2022.
//

import Foundation
import Moya
import Alamofire

//protocol MoviesViewModelDelegate {
//    func didFetchMovies()
//    func willFetchMovies()
//    func fetchDidFail()
//}

class MoviesViewModel {
    
    var movies: [TrendingAllDayModel.Result] = []
    var moviePopular: [MovieModel.Title] = []
    
//    func movie(_ index: Int) -> TrendingAllDayModel.Result? {
//        return movies[index]
//    }
    func movie(_ index: Int) -> TrendingAllDayModel.Result? {
        return movies[index]
    }
    
//    @objc func fetchMovies(completion: @escaping () -> (), failure: @escaping () -> ()) {
//        let provider = MoyaProvider<TheMovieDBAPI>()
//        provider.request(.movieslist) { result in
//            switch result {
//            case let .success(moyaResponse):
//                do {
//                    let movies = try JSONDecoder().decode(TrendingAllDayModel.self, from: moyaResponse.data)
//                    self.movies = movies.results
//                    completion()
////                    print(movies)
//                } catch {
//                    print(error.localizedDescription)
//                    failure()
//                }
//            case let .failure(error):
//                print(error.localizedDescription)
//                failure()
//            }
//        }
//    }
    
    @objc func fetchMovies(completion: @escaping () -> (), failure: @escaping () -> ()) {
        let provider = MoyaProvider<TheMovieDBAPI>()
        provider.request(.movieslist) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let movies = try JSONDecoder().decode(TrendingAllDayModel.self, from: moyaResponse.data)
                    self.movies = movies.results
                    completion()
//                    print("Test2",movies)
                } catch {
                    print(error.localizedDescription)
                    failure()
                }
            case let .failure(error):
                print(error.localizedDescription)
                failure()
            }
        }
    }
    
    func fetchTvs(completion: @escaping (Result<[TrendingAllDayModel.Result], Error>) -> Void) {
        let provider = MoyaProvider<TheMovieDBAPI>()
        provider.request(.tvshows) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let tvs = try JSONDecoder().decode(TrendingAllDayModel.self, from: moyaResponse.data)
                    self.movies = tvs.results
                    completion(.success(tvs.results))
//                    print("test3", tvs)
                } catch {
                    print(error.localizedDescription)
                    
                }
            case let .failure(error):
                print(error.localizedDescription)
                    
            }
        }
    }
    
    func upComingMovies(completion: @escaping (Result<[TrendingAllDayModel.Result], Error>) -> Void) {
        let provider = MoyaProvider<TheMovieDBAPI>()
        provider.request(.movieUpComing) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let upComing = try JSONDecoder().decode(TrendingAllDayModel.self, from: moyaResponse.data)
                    self.movies = upComing.results
                    completion(.success(upComing.results))
                } catch {
                    print(error.localizedDescription)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
