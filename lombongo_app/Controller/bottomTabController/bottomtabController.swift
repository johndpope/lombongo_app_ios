//
//  bottomtabController.swift
//  lombongo_app
//
//  Created by Mauro Benedito on 17/11/2018.
//  Copyright © 2018 Mauro Benedito. All rights reserved.
//

import UIKit

class bottomtabControllertab: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userView = userProfileViewController()
        let settings = UIViewController()
        settings.view.backgroundColor = UIColor.yellow
        
        userView.navigationItem.title = "Perfil"
       
        
        
        let navController = UINavigationController(rootViewController: userView)
        
        
        viewControllers = [navController]
        
        
    }
}
