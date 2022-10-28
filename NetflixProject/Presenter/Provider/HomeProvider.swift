//
//  HomeProvider.swift
//  NetflixProject
//
//  Created by Ivan Valero on 23/09/2022.
//

import Foundation

protocol HomeProviderProtocol {
    func getTrendingAll() async throws -> TrendingAllDayModel
}

class HomeProvider: HomeProviderProtocol {
    func getTrendingAll() async throws -> TrendingAllDayModel{
        
        let requesModel = RequestModel(endpoint: .trendingAll)
        
        do {
            let model = try await ServiceLayer.callService(requesModel, TrendingAllDayModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
        
    }
}
