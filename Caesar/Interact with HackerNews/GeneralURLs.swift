//
//  FavIconURL.swift
//  Caesar
//
//  Created by Arteezy on 11/14/21.
//

import Foundation

struct GeneralURLs {
//  This is the base url to get favicon, append a website's domain to this url and we get a favicon that is fetched by google's crawler
    static var googleFavIconFetcher = "https://www.google.com/s2/favicons?sz=64&domain_url="

//  Use this url if something goes wrong, this is only used if "googleFavIconFetcher" cannot return a image. This link returns google's icon.
    static var fallbackFaviconURL = "https://www.google.com/favicon.ico"
}
