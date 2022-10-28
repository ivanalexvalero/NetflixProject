//
//  HomePresenter.swift
//  NetflixProject
//
//  Created by Ivan Valero on 23/09/2022.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func getData(list: [[Any]])
}

class HomePresenter {
    var provider: HomeProviderProtocol
    weak var delegate: HomeViewProtocol?
    private var objectList: [[Any]] = []
    
    init(delegate: HomeViewProtocol, provider: HomeProviderProtocol = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
    }
    
    func getHomeObjects() async{
        objectList.removeAll()
        async let trendingAll = try await provider.getTrendingAll().results
        
        do {
            let responseTrendingAll = await (try trendingAll)
            
            objectList.append(responseTrendingAll)
            delegate?.getData(list: objectList)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
