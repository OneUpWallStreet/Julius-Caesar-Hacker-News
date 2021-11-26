//
//  HomePageInteraction.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import Foundation
import LinkPresentation

class HomePageInteraction {
    
    static func ReturnPlaceholderPhoto() -> UIImage{
        let placeholderImage: UIImage = UIImage(named: "placeholder")!
        return placeholderImage
    }
    
    static func GetWebsitePreviewPhoto(url: String,completion: @escaping (UIImage) -> Void){
        
            let provider = LPMetadataProvider()
            let url = URL(string: url)!
            
            provider.startFetchingMetadata(for: url) { meta, error in
    //          Something went wrong while fetching the image
                if error != nil {
//                  Returning default placeholder image
                    let placeholderImage: UIImage = ReturnPlaceholderPhoto()
                    completion(placeholderImage)
                    return
                }
                
                guard let imageProvider = meta?.imageProvider else {
                    let placeholderImage: UIImage = ReturnPlaceholderPhoto()
                    completion(placeholderImage)
                    return
                    
                }
                
                imageProvider.loadObject(ofClass: UIImage.self) { (image,error) in
                    if error != nil {
//                      Returning default placeholder image
                        let placeholderImage: UIImage = ReturnPlaceholderPhoto()
                        completion(placeholderImage)
                        return
                    }
                    
                    if let image = image as? UIImage {
                        completion(image)
                        return
                    }
                    else{
//                      Returning default placeholder image
                        let placeholderImage: UIImage = ReturnPlaceholderPhoto()
                        completion(placeholderImage)
                        return
                    }
                }
            }

    }
    
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
    
    static func GetTopPosts(id: Int,completion: @escaping (HackerNewsSingleItem) -> Void) {
        
//      This is for testing purposes, remove this line in production, rn we break at index = 10 to avoid rate limits.
        let url = HackerNewsAPIsURLs.baseItemURL + "\(id).json"
        guard let url = URL(string: url) else { print("erorr with url sorry"); return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in

            if let data = data {
                let decoder = JSONDecoder()
                if let decodedResponse = try? decoder.decode(HackerNewsSingleItem.self, from: data){
                    DispatchQueue.main.async {
//                        print("Response: \(decodedResponse) ")
                        completion(decodedResponse)
                    }
                }
            }
        }.resume()        
    }

}


