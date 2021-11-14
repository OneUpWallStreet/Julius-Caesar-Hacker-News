//
//  ViewController.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import UIKit

class ViewController: UITabBarController {
        
    let HomeVC: UIViewController = HomeViewController()
    let ShowVC: UIViewController = ShowViewController()
    let JobsVC: UIViewController = JobsViewController()
    let AskVC: UIViewController = AskViewController()
//    let customTabBar: UITabBarController = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            
        HomeVC.title = "Home"
        AskVC.title = "Ask"
        JobsVC.title = "Jobs"
        ShowVC.title = "Show"
        
        self.tabBar.scrollEdgeAppearance = .none
        self.setViewControllers([HomeVC,AskVC,JobsVC,ShowVC], animated: false)
        
//      iOS 15 tab bar is bugged, the background color is missing, this is a fix  found at "https://stackoverflow.com/questions/68688270/ios-15-uitabbarcontrollers-tabbar-background-color-turns-black"
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }

        guard let items = self.tabBar.items else {return}
        let images = ["house","person.crop.circle","person.crop.circle","person.crop.circle"]

        for (index,item) in items.enumerated() {
            item.image = UIImage(systemName: images[index])
        }

    }

}

