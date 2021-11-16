//
//  HomeModel.swift
//  Caesar
//
//  Created by Arteezy on 11/14/21.
//

import Foundation

class HomeModel {
    
    static let HomePagePostCount: Int = 10
    
    func GetTopPosts(completion: @escaping (HackerNewsSingleItem) -> Void) {
                
        HomePageInteraction.GetTopPostIDS { ids in
            for (index,id) in ids.enumerated() {
                if index == HomeModel.HomePagePostCount { break }
                HomePageInteraction.GetTopPosts(id: id) { post in
                    completion(post)
                }
            }
        }
    }
}
