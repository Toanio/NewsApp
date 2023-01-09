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
    
    //Сделан с использованием Result + Complition
    func getTopNews(complition: @escaping (Result<[News], Error>)-> Void) {
        
        guard let url = URL(string: "\(Constants.base_URL)top?api_token=\(Constants.API_KEY)&locale=us&limit=5") else {
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
    
    func fetchTopNews(complition: @escaping ([News], Error?) -> ()) {
        guard let url = URL(string: "\(APICaller.Constants.base_URL)top?api_token=\(APICaller.Constants.API_KEY)&locale=us&limit=5") else { return }

        URLSession.shared.dataTask(with: url) { data, _, err in
            if let err = err {
                print("Failed to fetch apps", err)
                complition([], nil)
                return
            }
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(NewsData.self, from: data)
                complition(searchResult.data, nil)
            } catch let jsonErr{
                print("Failed to decode json", jsonErr)
                complition([], jsonErr)
            }
        }.resume()
    }
    
    func fetchHeadlines(complition: @escaping ([News], Error?) -> ()) {
        guard let url = URL(string: "\(APICaller.Constants.base_URL)all?api_token=\(APICaller.Constants.API_KEY)&categoties=food&locale=us&limit=5&categories=food") else { return }

        URLSession.shared.dataTask(with: url) { data, _, err in
            if let err = err {
                print("Failed to fetch apps", err)
                complition([], nil)
                return
            }
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(NewsData.self, from: data)
                complition(searchResult.data, nil)
            } catch let jsonErr{
                print("Failed to decode json", jsonErr)
                complition([], jsonErr)
            }
        }.resume()
    }
}
    

