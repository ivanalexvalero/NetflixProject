//
//  DownloadViewController.swift
//  NetflixProject
//
//  Created by Ivan Valero on 14/09/2022.
//

import UIKit

class DownloadViewController: UIViewController {

    let defaultColor: ColorExtension = ColorExtension.defaultColor
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = defaultColor.backgroundColor
    }

}
