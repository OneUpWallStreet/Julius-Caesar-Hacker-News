//
//  HomePageInteraction.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import Foundation



class HomePageInteraction {
    
//  This gets the top stories on Hacker news, it returns the post-ids in the completion
    static func GetTopPostIDS(completion: @escaping (Array<Int>) -> Void) {
        var arrayIds: Array<Int> = []
        let url = URL(string: HackerNewsAPIsURLs.TopStories)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let ids = (try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0))) as? Array<Int> {
                    DispatchQueue.main.async {
                        arrayIds = ids
                        completion(arrayIds)
                    }
                }
            }
        }.resume()
    }
    
    
    static func GetTopPosts() {
        GetTopPostIDS { ids in
            for (index,id) in ids.enumerated() {
                
//              This is for testing purposes, remove this line in production, rn we break at index = 10 to avoid rate limits.
                if index == 10 {break}
                let url = HackerNewsAPIsURLs.baseItemURL + "\(id).json"
                guard let url = URL(string: url) else { print("erorr with url sorry"); return }
                print("url is \(url)")
                
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    if let data = data {
                        let decoder = JSONDecoder()
                        if let decodedResponse = try? decoder.decode(HackerNewsSingleItem.self, from: data){
                            DispatchQueue.main.async {
                                print("decodedResponse = \(decodedResponse)")
                            }
                        }
                    }
                }.resume()
            }
        }
    }
}


