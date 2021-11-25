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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        LoadPosts()
        SetUpCollectionView()
    }
    
//  Sets up a collectionView for top posts from Hacker News
    private func SetUpCollectionView() {
        let cellPadding: CGFloat = 10
        let sectionPadding: CGFloat = 5
        let layout = UICollectionViewFlowLayout()
                
        layout.minimumLineSpacing = cellPadding
        layout.minimumInteritemSpacing = sectionPadding
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        
//        self.verticalLayoutConstraint.constant = self.collectionView.contentSize.height;
        
        postCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        postCollection.translatesAutoresizingMaskIntoConstraints = false
        postCollection.register(HomeSecondCollectionViewCell.self, forCellWithReuseIdentifier: postCollectionIdentifier)
//        postCollection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: postCollectionIdentifier)
        postCollection.delegate = self
        postCollection.dataSource = self
        view.addSubview(postCollection)
        
//        postCollection.vertical
        
        
        NSLayoutConstraint.activate([
            postCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            postCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            postCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    //Loading Posts from HomeModel, the API gets top posts one at a time, so this function gets the top-20 posts
    private func LoadPosts() {
        homeModel.GetTopPosts { post in
            
            self.Posts.append(post)
//          I want to reload the page when 5:(arbitary/temp-number) posts are fetched from the server
            print("\n \n \n Posts.count: \(self.Posts.count) and official value is \(HomeModel.HomePagePostCount)")
            if self.Posts.count == HomeModel.HomePagePostCount || self.Posts.count == HomeModel.HomePagePostCount-2 || self.Posts.count > HomeModel.HomePagePostCount - 30 {
                print("\n \n \n \n Should reload Data \n ")
                self.postCollection.reloadData()
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let post = Posts[indexPath.item]
        let titleWordSize = post.title.count
        
        if titleWordSize <= 35 {
            return CGSize(width: postCollection.frame.width, height: 140)
        }
        else if titleWordSize <= 65 {
            return CGSize(width: postCollection.frame.width, height: 140)
        }
        else {
            return CGSize(width: postCollection.frame.width, height: 140)
        }
        
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
        let cell = postCollection.dequeueReusableCell(withReuseIdentifier: postCollectionIdentifier, for: indexPath) as! HomeSecondCollectionViewCell
        let post = Posts[indexPath.item]
        cell.configureSinglePost(post)
        return cell
    }
    
    
}
