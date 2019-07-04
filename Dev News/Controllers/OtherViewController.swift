//
//  OtherViewController.swift
//  Dev News
//
//  Created by khoale on 7/4/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import UIKit
import Alamofire

class OtherViewController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ArticlesCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        fetchArticle()
    }
    
    fileprivate func fetchArticle() {
        let urlString = APIService.otherUrl
        APIService.shared.fetchArticle(urlString: urlString) { (articles) in
            self.articles = articles
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ArticlesCell
        let article = articles[indexPath.row]
        cell.article = article
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let article = articles[indexPath.row]
        let selectedArticleUrl = article.url
        let articleWebViewController = ArticleWebViewController()
        
        articleWebViewController.selectedArticleURL = selectedArticleUrl
        navigationController?.pushViewController(articleWebViewController, animated: true)
    }
    
}






