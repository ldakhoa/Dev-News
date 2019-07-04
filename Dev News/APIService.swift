//
//  APIService.swift
//  Dev News
//
//  Created by khoale on 7/4/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    
    static let allUrl = "http://82736e73.ngrok.io/api/articles/all"
    static let vietnameseUrl = "http://82736e73.ngrok.io/api/articles/vietnamese"
    static let financialUrl = "http://82736e73.ngrok.io/api/articles/financial"
    static let technicalUrl = "http://82736e73.ngrok.io/api/articles/technical"
    static let otherUrl = "http://82736e73.ngrok.io/api/articles/other"
    
    func fetchArticle(urlString: String, completion: @escaping([Article]) -> Void) {
        
        let urlString = urlString
        Alamofire.request(urlString).response { (dataResponse) in
            if let error = dataResponse.error {
                print("Failed error\(error)")
                return
            }
            
            guard let data = dataResponse.data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let articleJson = try decoder.decode(Articles.self, from: data)
                completion(articleJson.articles)
                
                print("Finish fetch")
            } catch let decodeErr {
                print("Failed to decode: \(decodeErr)")
            }
        }
        
        
    }
    
}
