//
//  HackerNewsSingleItem.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import Foundation
import UIKit



struct PostData {
    var Post: HackerNewsSingleItem
    var favIcon: UIImage?
    var placeholderImage: UIImage = UIImage(named: "place")!
}

//This is for getting hacker-news post using a referance id
struct HackerNewsSingleItem: Codable,Equatable{
    let by: String
    let descendants: Int
    let id: Int
    let score: Int
    let kids: Array<Int>
    let time: Int
    let title: String
    let type: String
    let url: String
}




