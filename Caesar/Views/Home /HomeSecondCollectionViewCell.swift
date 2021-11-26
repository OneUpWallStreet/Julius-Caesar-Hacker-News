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
    
    let score: UITextView = UITextView()
    let scoreImage: UIImageView = UIImageView()
    
    let descendants: UITextView = UITextView()
    let descendantsImage: UIImageView = UIImageView()

//    let mainStack: UIStackView = UIStackView(arrangedSubviews: [title,placeholderImage])
    let detailStack: UIStackView = UIStackView()
    let imageStack: UIStackView = UIStackView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.backgroundColor = .yellow
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 2
        configureStackView()
        
//      Sizes of Title are 34,52,70

        
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
        score.text = 0.convertToString(post.score)
        descendants.text = 0.convertToString(post.descendants)
        
        let titleSize: CGSize = title.sizeThatFits(title.bounds.size)
        print("Title Size:  \(titleSize)")
    }
    
    func configurePostDetails() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 15, weight: .bold)
        title.textColor = UIColor.black
        title.isScrollEnabled = false
        title.isEditable = false
        contentView.addSubview(title)
        
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
        
        score.translatesAutoresizingMaskIntoConstraints = false
        score.textColor = UIColor.black
        score.isScrollEnabled = false
        score.isEditable = false
        score.font = .systemFont(ofSize: 10, weight: .thin)
        contentView.addSubview(score)
        
        scoreImage.translatesAutoresizingMaskIntoConstraints = false
        scoreImage.image = UIImage(systemName: "hand.thumbsup")
        contentView.addSubview(scoreImage)

        descendants.translatesAutoresizingMaskIntoConstraints = false
        descendants.textColor = UIColor.black
        descendants.isScrollEnabled = false
        descendants.isEditable = false
        descendants.font = .systemFont(ofSize: 10, weight: .thin)
        contentView.addSubview(descendants)
        
        descendantsImage.translatesAutoresizingMaskIntoConstraints = false
        descendantsImage.image = UIImage(systemName: "bubble.right")
        contentView.addSubview(descendantsImage)
        
    }
        
    func configureStackView() {
        
        configurePostDetails()

        let headerView: UIStackView = UIStackView(arrangedSubviews: [favIcon,url])
        
        headerView.axis = .horizontal
        headerView.distribution = .equalSpacing
        headerView.alignment = .center

        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            favIcon.heightAnchor.constraint(equalToConstant: 15),
            favIcon.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            url.leadingAnchor.constraint(equalTo: favIcon.trailingAnchor)
        ])
        
        let footerView: UIStackView = UIStackView(arrangedSubviews: [scoreImage,score,descendantsImage,descendants])
        
        footerView.axis = .horizontal
        footerView.alignment = .center
        
        NSLayoutConstraint.activate([
            scoreImage.heightAnchor.constraint(equalToConstant: 15),
            scoreImage.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            descendantsImage.heightAnchor.constraint(equalToConstant: 15),
            descendantsImage.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        let mainStack: UIStackView = UIStackView(arrangedSubviews: [headerView,title,by,footerView])
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.distribution = .equalSpacing
        
        title.backgroundColor = .red
        
        mainStack.setCustomSpacing(0, after: headerView)
        mainStack.setCustomSpacing(0, after: title)
        mainStack.setCustomSpacing(0, after: by)
        contentView.addSubview(mainStack)
        
        placeholderImage.translatesAutoresizingMaskIntoConstraints = false
        placeholderImage.image = UIImage(named: "place")
        placeholderImage.layer.borderWidth = 0.5
        placeholderImage.layer.borderColor = UIColor.black.cgColor
        placeholderImage.layer.cornerRadius = 5
        contentView.addSubview(placeholderImage)
        
        NSLayoutConstraint.activate([
            placeholderImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            placeholderImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            placeholderImage.heightAnchor.constraint(equalToConstant: 80),
            placeholderImage.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.trailingAnchor.constraint(equalTo: placeholderImage.leadingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
