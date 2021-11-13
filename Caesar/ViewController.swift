//
//  ViewController.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import UIKit

class ViewController: UITabBarController {
    
    
    
    let HomeVC: UIViewController = HomeViewController()
    let ProfileVC: UIViewController = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            
        HomeVC.title = "Home"
        ProfileVC.title = "Profile"
        self.tabBar.scrollEdgeAppearance = .none
        self.setViewControllers([HomeVC,ProfileVC], animated: false)

        
//      iOS 15 tab bar is bugged, the background color is missing, this is a fix I found on "https://stackoverflow.com/questions/68688270/ios-15-uitabbarcontrollers-tabbar-background-color-turns-black"
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }

        guard let items = self.tabBar.items else {return}
        let images = ["house","person.crop.circle"]

        for (index,item) in items.enumerated() {
            print("Index is \(index) and item is \(item)")
            item.image = UIImage(systemName: images[index])
        }

        
    }

}

