//
//  HomeViewController.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeModel: HomeModel = HomeModel()
    
//  This array will get updated everytime homeModel.GetTopPosts() gets a response.
    var Posts: Array<HackerNewsSingleItem> = []
    var postCollection: UICollectionView!
    let postCollectionIdentifier = "postCollectionIdentifier"
    var reloadButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        LoadPosts()
        tempButton()
        SetUpCollectionView()

    }
    
    private func SetUpCollectionView() {
        let cellPadding: CGFloat = 10
        let sectionPadding: CGFloat = 5
        let layout = UICollectionViewFlowLayout()
        
        
        layout.minimumLineSpacing = cellPadding
        layout.minimumInteritemSpacing = sectionPadding
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        
        postCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        postCollection.translatesAutoresizingMaskIntoConstraints = false
        postCollection.backgroundColor = .yellow
        postCollection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: postCollectionIdentifier)
        postCollection.delegate = self
        postCollection.dataSource = self
        view.addSubview(postCollection)

        NSLayoutConstraint.activate([
            postCollection.topAnchor.constraint(equalTo: reloadButton.bottomAnchor, constant: 20),
            postCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            postCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    
    private func tempButton() {
        
        reloadButton.setTitle("reload", for: .normal)
        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.setTitleColor(.red, for: .normal)
        reloadButton.layer.borderWidth = 1
        reloadButton.layer.borderColor = UIColor.yellow.cgColor
        reloadButton.addTarget(self, action: #selector(reloadYay), for: .touchUpInside)
        view.addSubview(reloadButton)
        
        NSLayoutConstraint.activate([
            reloadButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            reloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reloadButton.heightAnchor.constraint(equalToConstant: 50),
            reloadButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func reloadYay() {
        postCollection.reloadData()
//        print("\n")
//        print("Posts: \(Posts)")
    }

    //Loading Posts from HomeModel, the API gets top posts one at a time, so this function gets the top-20 posts
    private func LoadPosts() {
        homeModel.GetTopPosts { post in
            self.Posts.append(post)
        }
    }
    
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: postCollection.frame.width, height: 200)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postCollection.dequeueReusableCell(withReuseIdentifier: postCollectionIdentifier, for: indexPath) as! HomeCollectionViewCell
        let post = Posts[indexPath.item]
        cell.ConfigurePost(post)
        return cell
    }
    
    
}


