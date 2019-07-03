//
//  ViewController.swift
//  Dev News
//
//  Created by khoale on 7/2/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import UIKit
import Alamofire

extension String {
    
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
    
}

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Articles"
        
        fetchArticle()

    }
    
    fileprivate func fetchArticle() {
        let urlString = "https://904248eb.ngrok.io/api/articles/vietnamese"
//        let urlString = "http://127.0.0.1:3366/api/articles/vietnamese"
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
                self.articles = articleJson.articles
                self.tableView.reloadData()
                
                
                
                print("Finish fetch")
            } catch let decodeErr {
                print("Failed to decode: \(decodeErr)")
            }
        }
        

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        
        return cell
    }

}





