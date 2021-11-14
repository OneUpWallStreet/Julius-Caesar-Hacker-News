//
//  HomeCollectionViewCell.swift
//  Caesar
//
//  Created by Arteezy on 11/14/21.
//

import UIKit


extension Int {
    func convertToString(_ number: Int) -> String{
        return "\(number)"
    }
}

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    let title: UILabel = UILabel()
    let score: UILabel = UILabel()
    let by: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor.red
        contentView.addSubview(title)
        
        score.translatesAutoresizingMaskIntoConstraints = false
        score.textColor = UIColor.red
        contentView.addSubview(score)
        
        by.translatesAutoresizingMaskIntoConstraints = false
        by.textColor = UIColor.red
        contentView.addSubview(by)
        
        SetUpConstraints()
    
    }
    
    func ConfigurePost(_ post: HackerNewsSingleItem) {
        title.text = post.title
        score.text = 0.convertToString(post.score)
        by.text = post.by
    }
    
    func SetUpConstraints() {
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            score.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            score.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            by.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            by.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
