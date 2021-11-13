//
//  HackerNewsSingleItem.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import Foundation

//This is for getting hacker-news post using a referance id
struct HackerNewsSingleItem: Codable {
    let by: String
    let descendants: Int
    let id: Int
    let score: Int
    let time: Int
    let title: String
    let type: String
    let url: String
}

