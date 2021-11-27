//
//  SimulatorViewController.swift
//  Caesar
//
//  Created by Arteezy on 11/27/21.
//

import UIKit

class SimulatorViewController: UIViewController {

    let test: UITextView = UITextView()
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        test.translatesAutoresizingMaskIntoConstraints = false
        test.font = .systemFont(ofSize: 15, weight: .bold)
        test.textColor = UIColor.black
        test.isScrollEnabled = false
        test.isEditable = false
        view.addSubview(test)
        
        NSLayoutConstraint.activate([
            test.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            test.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            test.widthAnchor.constraint(equalToConstant: 255.0)
        ])
        // Do any additional setup after loading the view.
    }
    
    func returnHeight() -> CGFloat {
        return test.sizeThatFits(test.bounds.size).height
    }
    
    func configureText(_ text: String) {
        test.text = text
    }
    
    
    



}
