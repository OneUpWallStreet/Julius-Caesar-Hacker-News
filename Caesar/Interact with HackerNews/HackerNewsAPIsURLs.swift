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


extension String {
    func StripURLMakeAttractive(_ url: String) -> String {
            
        let url = URL(string: url)
        guard let domain = url?.host else {return "error"}
        var modifiedDomain: String = ""
        
        var checkWWW: String = ""
        let checkIndexes = [0,1,2,3]
    
        for (index,char) in domain.enumerated() {
            if checkIndexes.contains(index){
                checkWWW.append(char)
            }
            if index > 3 && checkWWW.lowercased() == "www."  {
                modifiedDomain.append(char)
            }
        }
        
        if checkWWW.lowercased() == "www."{
            return modifiedDomain
        }
        else {
            return domain
        }
        
    }
}
