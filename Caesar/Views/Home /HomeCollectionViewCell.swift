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
    let favIcon: UIImageView = UIImageView()
    let richLinkImage: UIImageView = UIImageView()
    
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
        
        favIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favIcon)
        
        richLinkImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(richLinkImage)
        
        SetUpConstraints()
    }
    
    func getFavIcon(_ websiteDomain: String) {
        let imageURL: String = GeneralURLs.googleFavIconFetcher + "\(websiteDomain)"
        let url = URL(string: imageURL)
        if let data = try? Data(contentsOf: url!) {
            favIcon.image = UIImage(data: data)
        }
        else {
            print("In else hello")
            let url = URL(string: GeneralURLs.fallbackFaviconURL)
            let fallbackData = try? Data(contentsOf: url!)
            favIcon.image = UIImage(data: fallbackData!)
        }
    }
    
    func ConfigurePost(_ post: HackerNewsSingleItem) {
        
        title.text = post.title
        score.text = 0.convertToString(post.score)
        by.text = post.by
        
        getFavIcon(post.url)
        HomePageInteraction.dog(url: post.url, completion: { image in
            DispatchQueue.main.async {
                self.richLinkImage.image = image
            }
        })
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
        
        NSLayoutConstraint.activate([
            favIcon.topAnchor.constraint(equalTo: by.bottomAnchor, constant: 10),
            favIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            favIcon.heightAnchor.constraint(equalToConstant: 40),
            favIcon.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            richLinkImage.topAnchor.constraint(equalTo: favIcon.bottomAnchor, constant: 10),
            richLinkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            richLinkImage.widthAnchor.constraint(equalToConstant: 80),
            richLinkImage.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
