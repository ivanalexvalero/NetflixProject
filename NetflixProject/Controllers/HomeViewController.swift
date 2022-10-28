//
//  HomeViewController.swift
//  NetflixProject
//
//  Created by Ivan Valero on 14/09/2022.
//

import UIKit

enum Sections: Int {
    case PeliculasPopulares = 0
//    case ContinuarViendo = 1
//    case Tendencias = 2
}

class HomeViewController: UIViewController {
    
    lazy var presenter = HomePresenter(delegate: self)
    private var objectList: [[Any]] = []

    let sectionTitle: [String] = ["Películas populares", "Continuar viendo", "Tendencias", "Popular en Netflix", "Mi lista"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.kId)
        return table
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(homeFeedTable)
        configHomeFeedTable()
        configNavBar()
        
        Task {
            await presenter.getHomeObjects()
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }


    private func configHomeFeedTable() {
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
    }
    
    private func configNavBar() {
//        var image = UIImage(named: "netflixLogo")
//        image = image?.withRenderingMode(.alwaysOriginal)
//        lazy var leftButton = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(self.leftButtonNavBar(_:)))
//        navigationItem.leftBarButtonItem = leftButton

        
        
        let buttonWidth = CGFloat(30)
        let buttonHeight = CGFloat(30)

        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "netflixLogo"), for: .normal)
        button.addTarget(self, action: #selector(self.leftButtonNavBar(_:)), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true

        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: button)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "tv"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .label
        
    }
    
    @objc func leftButtonNavBar(_ sende: UIBarButtonItem) {
        print("lefButton")
    }
    
    private func getTrendingMovie() async throws -> TrendingAllDayModel {
        do {
            let model = try await ServiceLayer.callService(RequestModel(endpoint: .trendingAll), TrendingAllDayModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
//        return objectList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return objectList[section].count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = objectList[indexPath.section]
//        if let trendingAll = item as? [TrendingAllDayModel.Result] {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.kId, for: indexPath) as? CollectionViewTableViewCell else {
//                    return UITableViewCell()
//            }
//            cell.configCollection(with: trendingAll[indexPath.row])
//            return cell
//        }
//        return UITableViewCell()
        
        //
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.kId, for: indexPath) as? CollectionViewTableViewCell else {
                    return UITableViewCell()
            }
            
            switch indexPath.section {
            case Sections.PeliculasPopulares.rawValue:
                let item = objectList
                if let trendingAll = item as? [TrendingAllDayModel.Result] {
                    cell.configCollection(with: trendingAll)
                }
            
                
            default:
                return UITableViewCell()
            }
            
            
            return cell
       
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .label
        header.textLabel?.text = header.textLabel?.text?.capitalizedSentence
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
}


extension HomeViewController: HomeViewProtocol {
    func getData(list: [[Any]]) {
        objectList = list
        print("List: ", list)
        DispatchQueue.main.async {
            self.homeFeedTable.reloadData()
        }
    }
}
