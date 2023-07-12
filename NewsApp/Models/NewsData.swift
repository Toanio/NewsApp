//
//  News.swift
//  NewsApp
//
//  Created by c.toan on 01.11.2022.
//

import Foundation

struct NewsData: Decodable {
    let data: [News]
}

struct News: Decodable {
    let uuid: String
    let title: String
    let description: String
    let url: String
    let imageUrl: String
    let publishedAt: String
}
//TODO: - Разобраться с категориями
