//
//  HackerNewsAPIsURLs.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import Foundation


struct HackerNewsAPIsURLs {
    
//  You append to the url the post-id.json/comment-id.json for eg. "https://hacker-news.firebaseio.com/v0/item/29193796.json"
    static var baseItemURL = "https://hacker-news.firebaseio.com/v0/item/"    
    
    static var TopStories = "https://hacker-news.firebaseio.com/v0/topstories.json"
    static var NewStories = "https://hacker-news.firebaseio.com/v0/newstories.json"
}
