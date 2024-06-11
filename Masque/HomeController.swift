//
//  HomeController.swift
//  Masque
//
//  Created by Jason Zheng on 3/15/17.
//  Copyright © 2017 Jason Zheng. All rights reserved.
//

import UIKit
import FBSDKLoginKit

let cellId = "cellId"

class HomeController: UIViewController {
    
    var posts = [Post]()
    var fbSDKAccessToken: FBSDKAccessToken!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sign out button
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        self.navigationController?.navigationBar.tintColor = .white
        
        
        
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        
        navigationController.title = "News Feed"
        
//        navigationController.tabBarItem.image = UIImage(named: "news_feed_icon")
        
//        viewControllers = [navigationController]
        
//        tabBar.isTranslucent = false
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.rgb(229, green: 231, blue: 235).cgColor
//        present(navigationController, animated: true, completion: {
//            //idk maybe do something
//        })
    }
    
    func handleSignOut() {
        FBSDKAccessToken.setCurrent(nil)
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}
