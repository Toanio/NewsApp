//
//  MainTabBarViewController.swift
//  NewsApp
//
//  Created by c.toan on 27.10.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: NotificationViewController())
        let vc4 = UINavigationController(rootViewController: StatsViewController())

        vc1.tabBarItem.image = UIImage(named: "homeButton")
        vc2.tabBarItem.image = UIImage(named: "searchButton")
        vc3.tabBarItem.image = UIImage(named: "notificationButton")
        vc4.tabBarItem.image = UIImage(named: "statsButton")

        tabBar.tintColor = UIColor(red: 0/255, green: 118/255, blue: 162/255, alpha: 100)
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
    
}
