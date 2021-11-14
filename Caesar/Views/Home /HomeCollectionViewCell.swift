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
    
    let title: UITextView = UITextView()
    let score: UITextView = UITextView()
    let by: UITextView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor.black
        title.isScrollEnabled = false
        contentView.addSubview(title)

        score.translatesAutoresizingMaskIntoConstraints = false
        score.textColor = UIColor.black
        score.isScrollEnabled = false
        contentView.addSubview(score)
        
        by.translatesAutoresizingMaskIntoConstraints = false
        by.isScrollEnabled = false
        by.textColor = UIColor.black
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
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            score.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            score.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            score.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            by.topAnchor.constraint(equalTo: score.bottomAnchor, constant: 20),
            by.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            by.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
