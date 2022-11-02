//
//  APICaller.swift
//  NewsApp
//
//  Created by c.toan on 01.11.2022.
//

import Foundation

class APICaller {
    struct Constants {
        static let API_KEY = "dqx5vX7y6fMKqzTzeZAM9eYS8BFbcN78xJOVCgqd"
        static let base_URL = "https://api.thenewsapi.com/v1/news/"
    }
    
    enum APIError: Error {
        case failedTogetData
    }
    
    static let shared = APICaller()
    
    func getTopNews(complition: @escaping (Result<[News], Error>)-> Void) {
        
        guard let url = URL(string: "\(Constants.base_URL)top?api_token=\(Constants.API_KEY)&locale=ru&limit=5") else {
            return 
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(NewsData.self, from: data)
                complition(.success(results.data))
            } catch {
                complition(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
                
    }
}
