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
    
    let tempTitle: UITextView = UITextView()

    let detailStack: UIStackView = UIStackView()
    let imageStack: UIStackView = UIStackView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 15, weight: .bold)
        title.textColor = UIColor.black
        title.isScrollEnabled = false
        title.isEditable = false
        contentView.addSubview(title)
        
        tempTitle.translatesAutoresizingMaskIntoConstraints = false
        tempTitle.font = .systemFont(ofSize: 15, weight: .bold)
        tempTitle.textColor = UIColor.black
        tempTitle.isScrollEnabled = false
        tempTitle.isEditable = false
        contentView.addSubview(tempTitle)
        
        placeholderImage.translatesAutoresizingMaskIntoConstraints = false
        placeholderImage.image = UIImage(named: "place")
        placeholderImage.layer.borderWidth = 0.5
        placeholderImage.layer.borderColor = UIColor.black.cgColor
        placeholderImage.layer.cornerRadius = 5
        contentView.addSubview(placeholderImage)
        
        NSLayoutConstraint.activate([
            placeholderImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            placeholderImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            placeholderImage.heightAnchor.constraint(equalToConstant: 80),
            placeholderImage.widthAnchor.constraint(equalToConstant: 80)
        ])
        
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
        
        DispatchQueue.global(qos: .userInitiated).async {
            HomePageInteraction.GetWebsitePreviewPhoto(url: post.url) { image in
                self.placeholderImage.image = image
            }
        }
        
        url.text = post.url.StripURLMakeAttractive(post.url)
        getFavIcon(post.url)
        title.text = post.title
        by.text = post.by
        score.text = 0.convertToString(post.score)
        descendants.text = 0.convertToString(post.descendants)
        
    }
    
    func configureHeaderView() -> UIStackView {
        
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
        
        return headerView
    }
    func configureFooterView() -> UIStackView {
        
        let footerView: UIStackView = UIStackView(arrangedSubviews: [scoreImage,score,descendantsImage,descendants])
        
        footerView.axis = .horizontal
        footerView.alignment = .center
        
        
        NSLayoutConstraint.activate([
            scoreImage.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 5),
            scoreImage.heightAnchor.constraint(equalToConstant: 15),
            scoreImage.widthAnchor.constraint(equalToConstant: 15),
        ])
        
        NSLayoutConstraint.activate([
            score.leadingAnchor.constraint(equalTo: scoreImage.trailingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            descendantsImage.leadingAnchor.constraint(equalTo: score.trailingAnchor,constant: 5),
            descendantsImage.heightAnchor.constraint(equalToConstant: 15),
            descendantsImage.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            descendants.leadingAnchor.constraint(equalTo: descendantsImage.trailingAnchor, constant: 5)
        ])
        
        
        return footerView
    }
    
    func configureMainStack(headerView: UIStackView, footerView: UIStackView)  {
        
        let mainStack: UIStackView = UIStackView(arrangedSubviews: [headerView,title,by,footerView])
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.distribution = .equalSpacing
        
        contentView.addSubview(mainStack)
        
        
        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.trailingAnchor.constraint(equalTo: placeholderImage.leadingAnchor)
        ])
        
        
    }

    func configureStackView() {
        
        let headerView = configureHeaderView()
        let footerView = configureFooterView()
        configureMainStack(headerView: headerView, footerView: footerView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
