//
//  MainView.swift
//  NetflixProject
//
//  Created by Ivan Valero on 14/09/2022.
//  
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {

    let defaultColor: ColorExtension = ColorExtension.defaultColor

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = defaultColor.backgroundColor
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        
        vc1.title = "Home"
        vc2.title = "Comming Soon"
        vc3.title = "Top search"
        vc4.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
    }
    
}

