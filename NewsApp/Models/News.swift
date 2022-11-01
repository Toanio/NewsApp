//
//  News.swift
//  NewsApp
//
//  Created by c.toan on 01.11.2022.
//

import Foundation

struct NewsData: Codable {
    let data: [News]
}

struct News: Codable {
    let uuid: String
    let title: String?
    let description: String
    let url: String
    let image_url: String
    let published_at: String
}


