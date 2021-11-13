//
//  ProfileViewController.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let label: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        navigationItem.title = "Profile"
        
        label.text = "Label"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        SetUpConstraints()

        // Do any additional setup after loading the view.
    }
    
    func SetUpConstraints() {
        
        NSLayoutConstraint.activate([
        
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
    }
    


}
