//
//  HomePageInteraction.swift
//  Caesar
//
//  Created by Arteezy on 11/13/21.
//

import Foundation
import LinkPresentation

//
//let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//
//let url = URL(string: "https://stackoverflow.com/q/61286308/2101447")!
//
//LPMetadataProvider().startFetchingMetadata(for: url) { (linkMetadata, error) in
//    guard let linkMetadata = linkMetadata, let imageProvider = linkMetadata.iconProvider else { return }
//
//    print(linkMetadata.title ?? "Untitled")
//
//    imageProvider.loadObject(ofClass: UIImage.self) { (image, error) in
//        guard error == nil else {
//            // handle error
//            return
//        }
//
//        if let image = image as? UIImage {
//            // do something with image
//            DispatchQueue.main.async {
//                imageView.image = image
//            }
//        } else {
//            print("no image available")
//        }
//    }
//}


class HomePageInteraction {
    
    static func dog(url: String,completion: @escaping (UIImage) -> Void){
        
        DispatchQueue.global(qos: .userInteractive).async{
            let provider = LPMetadataProvider()
            let url = URL(string: url)!
            
            provider.startFetchingMetadata(for: url) { meta, error in
    //          Something went wrong while fetching the image
                if error != nil {
                    print("something went wrong while getting rich link")
                    return
                }
                
                guard let imageProvider = meta?.imageProvider else {return}
                
                imageProvider.loadObject(ofClass: UIImage.self) { (image,error) in
                    if error != nil {
                        return
                    }
                    
                    if let image = image as? UIImage {
                        completion(image)
                    }
                    else{
                        print("no image")
                    }
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
                        completion(decodedResponse)
                    }
                }
            }
        }.resume()        
    }

}


