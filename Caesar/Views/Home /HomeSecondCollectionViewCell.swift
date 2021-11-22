//
//  HomeSecondCollectionViewCell.swift
//  Caesar
//
//  Created by Arteezy on 11/22/21.
//

import UIKit

class HomeSecondCollectionViewCell: UICollectionViewCell {
    
    
    let by: UITextView = UITextView()
    let title: UITextView = UITextView()
    let url: UITextView = UITextView()
    let favIcon: UIImageView = UIImageView()
    let divider: UIView = UIView()
    let placeholderImage: UIImageView = UIImageView()

//    let mainStack: UIStackView = UIStackView(arrangedSubviews: [title,placeholderImage])
    let detailStack: UIStackView = UIStackView()
    let imageStack: UIStackView = UIStackView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        configureStackView()
        
    }
    
    
    func getFavIcon(_ websiteDomain: String) {
        let imageURL: String = GeneralURLs.googleFavIconFetcher + "\(websiteDomain)"
        let url = URL(string: imageURL)
        if let data = try? Data(contentsOf: url!) {
            favIcon.image = UIImage(data: data)
        }
        else {
            let url = URL(string: GeneralURLs.fallbackFaviconURL)
            let fallbackData = try? Data(contentsOf: url!)
            favIcon.image = UIImage(data: fallbackData!)
        }
    }
    
    func configureSinglePost(_ post: HackerNewsSingleItem) {
        url.text = post.url.StripURLMakeAttractive(post.url)
        getFavIcon(post.url)
        title.text = post.title
        by.text = post.by
    }
    
    
    func configurePostDetails() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 15, weight: .bold)
        title.textColor = UIColor.black
        title.isScrollEnabled = false
        title.isEditable = false
        contentView.addSubview(title)
        
        placeholderImage.translatesAutoresizingMaskIntoConstraints = false
        placeholderImage.image = UIImage(named: "place")
        placeholderImage.layer.borderWidth = 0.5
        placeholderImage.layer.borderColor = UIColor.black.cgColor
        placeholderImage.layer.cornerRadius = 5
        contentView.addSubview(placeholderImage)
        
        by.translatesAutoresizingMaskIntoConstraints = false
        by.textColor = UIColor.black
        by.isScrollEnabled = false
        by.isEditable = false
        by.font = .systemFont(ofSize: 10, weight: .semibold)
        contentView.addSubview(by)
        
        url.translatesAutoresizingMaskIntoConstraints = false
        url.textColor = UIColor.black
        url.isEditable = false
        url.font = .systemFont(ofSize: 12, weight: .semibold)
        url.isScrollEnabled = false
        contentView.addSubview(url)
        
        favIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favIcon)
        
        
        NSLayoutConstraint.activate([
            placeholderImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            placeholderImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            placeholderImage.heightAnchor.constraint(equalToConstant: 50),
            placeholderImage.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
    }
    
    func configureStackView() {
        
        let mainStack: UIStackView = UIStackView(arrangedSubviews: [title,placeholderImage,url,favIcon,by])
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.distribution = .equalSpacing
        mainStack.spacing = 10
        
        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        contentView.addSubview(mainStack)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}