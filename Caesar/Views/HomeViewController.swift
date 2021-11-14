//
//  HomeViewController.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeModel: HomeModel = HomeModel()
    var Posts: Array<HackerNewsSingleItem> = []
    var temp: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
                        
        homeModel.GetTopPosts { post in
            self.Posts.append(post)
        }
        
        // Do any additional setup after loading the view.
        temp.setTitle("Button", for: .normal)
        temp.layer.borderWidth = 1
        temp.layer.borderColor = UIColor.white.cgColor
        temp.addTarget(self, action: #selector(test), for: .touchUpInside)
        temp.setTitleColor(UIColor.white, for: .normal)
        temp.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(temp)
        
        SetUpConstraints()        
    }
    
    @objc func test() {
        print("Posts size -> \(Posts.count)")
        print("Points is: \(Posts)")
    }
    
    func SetUpConstraints() {
        NSLayoutConstraint.activate([
            temp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            temp.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


extension HomeViewController: UIPageViewControllerDelegate {
    
    
    
}
