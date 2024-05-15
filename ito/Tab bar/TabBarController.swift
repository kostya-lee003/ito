//
//  TabBarController.swift
//  ito
//
//  Created by Kostya Lee on 10/04/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    func setupVCs() {
           viewControllers = [
               createNavController(for: UIViewController(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
               createNavController(for: UIViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
               createNavController(for: UIViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
           ]
       }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    

}
