//
//  HomeViewController.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import UIKit



class HomeViewController: UIViewController {
    
    struct HomeCellSizes {
        static let small: CGFloat = 122
        static let medium: CGFloat = 140
        static let large: CGFloat = 158
        
        static func returnSize(_ size: CGFloat) -> CGFloat {
            if size < 40 {
                return small
            }
            else if size > 40 && size < 60 {
                return medium
            }
            else {
                return large
            }
        }
        
    }
    
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
                
        postCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        postCollection.translatesAutoresizingMaskIntoConstraints = false
        postCollection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: postCollectionIdentifier)
        postCollection.delegate = self
        postCollection.dataSource = self
        view.addSubview(postCollection)
                
        
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
            if self.Posts.count == HomeModel.HomePagePostCount || self.Posts.count == HomeModel.HomePagePostCount-2 || self.Posts.count > HomeModel.HomePagePostCount - 30 {
                
//                for post in self.Posts {
//                    print("\n _______________________________________________________ \n post: \(post.title) \n count: \(post.title.count) \n _______________________________________________________ \n ")
//                }
                
                self.postCollection.reloadData()
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  
        return CGSize(width: postCollection.frame.width, height: HomeCellSizes.large)

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
        cell.configureSinglePost(post)        
        
        return cell
        
    }
    
    
}
