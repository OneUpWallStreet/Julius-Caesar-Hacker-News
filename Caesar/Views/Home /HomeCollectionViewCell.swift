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
    
    
    
    let score: UITextView = UITextView()
    let scoreImage: UIImageView = UIImageView()
    
    let descendants: UITextView = UITextView()
    let descendantsImage: UIImageView = UIImageView()
    
    let by: UITextView = UITextView()
    let id: UITextView = UITextView()
    let time: UITextView = UITextView()
    let title: UITextView = UITextView()
    let url: UITextView = UITextView()
    let type: UITextView = UITextView()
    let favIcon: UIImageView = UIImageView()
    let richLinkImage: UIImageView = UIImageView()
    let divider: UIView = UIView()
    let placeholderImage: UIImageView = UIImageView()
    
    struct PaddingConstants {
        static let distanceVerticalPostCell: CGFloat = 10
        static let distanceVerticalTitle: CGFloat = 5
        
        static let distanceVerticalNegativePostCell: CGFloat = 9
        static let distanceLeadingAndTrailingAnchorPostCell: CGFloat = 3
        static let distanceLeadningForTitleByScoreDescendants: CGFloat = -1
        
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        descendants.translatesAutoresizingMaskIntoConstraints = false
        descendants.textColor = UIColor.black
        descendants.isScrollEnabled = false
        descendants.isEditable = false
        descendants.font = .systemFont(ofSize: 10, weight: .thin)
        contentView.addSubview(descendants)
        
        descendantsImage.translatesAutoresizingMaskIntoConstraints = false
        descendantsImage.image = UIImage(systemName: "bubble.right")
        contentView.addSubview(descendantsImage)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor.black
        title.isScrollEnabled = false
        title.isEditable = false
        title.backgroundColor = .red
        title.font = .systemFont(ofSize: 15, weight: .bold)
        contentView.addSubview(title)

        placeholderImage.translatesAutoresizingMaskIntoConstraints = false
        placeholderImage.image = UIImage(named: "place")
        placeholderImage.layer.borderWidth = 0.5
        placeholderImage.layer.borderColor = UIColor.black.cgColor
        placeholderImage.layer.cornerRadius = 5
        contentView.addSubview(placeholderImage)
        
        score.translatesAutoresizingMaskIntoConstraints = false
        score.textColor = UIColor.black
        score.isScrollEnabled = false
        score.isEditable = false
        score.font = .systemFont(ofSize: 10, weight: .thin)
        contentView.addSubview(score)
        
        scoreImage.translatesAutoresizingMaskIntoConstraints = false
        scoreImage.image = UIImage(systemName: "hand.thumbsup")
        contentView.addSubview(scoreImage)
        
        by.translatesAutoresizingMaskIntoConstraints = false
        by.textColor = UIColor.black
        by.isScrollEnabled = false
        by.isEditable = false
        by.font = .systemFont(ofSize: 10, weight: .semibold)
        contentView.addSubview(by)
        
        type.translatesAutoresizingMaskIntoConstraints = false
        type.textColor = UIColor.black
        type.isEditable = false
        type.isScrollEnabled = false
        contentView.addSubview(type)
        
        url.translatesAutoresizingMaskIntoConstraints = false
        url.textColor = UIColor.black
        url.isEditable = false
        url.font = .systemFont(ofSize: 12, weight: .semibold)
        url.isScrollEnabled = false
        url.backgroundColor = .yellow
        contentView.addSubview(url)
        
        divider.backgroundColor = .gray
        divider.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(divider)
        
        favIcon.translatesAutoresizingMaskIntoConstraints = false
        favIcon.backgroundColor = .cyan
        contentView.addSubview(favIcon)
        
        richLinkImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(richLinkImage)
        
        setUpPostConstraints()
        
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
//        var name: String = ""
//        for x in 0..<post.title.count{
//            name.append("a")
//        }
//        title.text = name
        
//        title.text = "a" * post.title.count
        title.text = post.title
        descendants.text = post.descendants.convertToString(post.descendants)
        by.text = post.by
        score.text = post.score.convertToString(post.score)
        
    }
    
    func setUpPostConstraints() {
        
        NSLayoutConstraint.activate([
            favIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: PaddingConstants.distanceLeadingAndTrailingAnchorPostCell),
            favIcon.heightAnchor.constraint(equalToConstant: 15),
            favIcon.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            url.leadingAnchor.constraint(equalTo: favIcon.trailingAnchor, constant: 5),
            url.centerYAnchor.constraint(equalTo: favIcon.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            divider.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            divider.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            placeholderImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1),
            placeholderImage.heightAnchor.constraint(equalToConstant: 100),
            placeholderImage.widthAnchor.constraint(equalToConstant: 100),
            placeholderImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10)
        ])
        
        
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: favIcon.bottomAnchor, constant: PaddingConstants.distanceVerticalPostCell),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: PaddingConstants.distanceLeadningForTitleByScoreDescendants),
            title.trailingAnchor.constraint(equalTo: placeholderImage.leadingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            by.topAnchor.constraint(equalTo: title.bottomAnchor, constant: -PaddingConstants.distanceVerticalNegativePostCell),
            by.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: PaddingConstants.distanceLeadningForTitleByScoreDescendants),
            by.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            scoreImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            scoreImage.heightAnchor.constraint(equalToConstant: 10),
            scoreImage.widthAnchor.constraint(equalToConstant: 10),
            scoreImage.topAnchor.constraint(equalTo: by.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            score.leadingAnchor.constraint(equalTo: scoreImage.trailingAnchor, constant: 5),
            score.heightAnchor.constraint(equalToConstant: 25),
            score.widthAnchor.constraint(equalToConstant: 35),
            score.topAnchor.constraint(equalTo: by.bottomAnchor, constant: -4)
        ])
        
        NSLayoutConstraint.activate([
            descendantsImage.leadingAnchor.constraint(equalTo: score.trailingAnchor, constant: 5),
            descendantsImage.topAnchor.constraint(equalTo: by.bottomAnchor, constant: 5),
            descendantsImage.heightAnchor.constraint(equalToConstant: 10),
            descendantsImage.widthAnchor.constraint(equalToConstant: 10)
        ])
        
        NSLayoutConstraint.activate([
            descendants.leadingAnchor.constraint(equalTo: descendantsImage.trailingAnchor, constant: 5),
            descendants.heightAnchor.constraint(equalToConstant: 25),
            descendants.topAnchor.constraint(equalTo: by.bottomAnchor, constant: -4),
            descendants.widthAnchor.constraint(equalToConstant: 35)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
