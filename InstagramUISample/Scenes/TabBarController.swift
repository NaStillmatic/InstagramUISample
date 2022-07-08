//
//  TabBarController.swift
//  InstagramUISample
//
//  Created by HwangByungJo  on 2022/07/08.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
   
    let feedViewController = UINavigationController(rootViewController: FeedViewController())
    
    feedViewController.tabBarItem = UITabBarItem(title: "",
                                                 image: UIImage(systemName: "house"),
                                                 selectedImage: UIImage(systemName: "house.fill"))
    
    let profileViewController = UINavigationController(rootViewController: ProfileViewController())
    
    profileViewController.tabBarItem = UITabBarItem(title: "",
                                                 image: UIImage(systemName: "person"),
                                                 selectedImage: UIImage(systemName: "person.fill"))
    
    viewControllers = [feedViewController, profileViewController]
  }
}
