//
//  HomeModel.swift
//  Caesar
//
//  Created by Arteezy on 11/14/21.
//

import Foundation

class HomeModel {
//    var Posts: Array<HackerNewsSingleItem> = []
    
    func GetTopPosts(completion: @escaping (HackerNewsSingleItem) -> Void) {
                
        HomePageInteraction.GetTopPostIDS { ids in
            for (index,id) in ids.enumerated() {
                if index == 5 { break }
                HomePageInteraction.GetTopPosts(id: id) { post in
                    completion(post)
                }
            }
        }
    }
}
