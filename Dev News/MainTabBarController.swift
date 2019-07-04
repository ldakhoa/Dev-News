//
//  MainTabBarController.swift
//  Dev News
//
//  Created by khoale on 7/4/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purple]
        UINavigationBar.appearance().tintColor = .purple
        
        tabBar.tintColor = .purple
        tabBar.isTranslucent = false
        setupViewControllers()
        
    }
    
    
    func setupViewControllers() {

        viewControllers = [
            // TODO: Change Favorite at first
            generateNavigationController(with: EverythingViewController(), title: "Everything", image: #imageLiteral(resourceName: "everything")),
            generateNavigationController(with: VietnameseViewController(), title: "Vietnamese", image: #imageLiteral(resourceName: "vietnamese")),
            generateNavigationController(with: FinancialViewController(), title: "Financial", image: #imageLiteral(resourceName: "financial")),
            generateNavigationController(with: TechnicalViewController(), title: "Technical", image: #imageLiteral(resourceName: "technical")),
            generateNavigationController(with: OtherViewController(), title: "Other", image: #imageLiteral(resourceName: "other")),

        ]
        
    }
    
    // MARK: - Helper functions
    
    fileprivate func generateNavigationController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        rootViewController.navigationItem.title = title
        
        
        return navController
    }
    
    
}
