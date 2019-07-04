//
//  EverythingViewController.swift
//  Dev News
//
//  Created by khoale on 7/4/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD

class EverythingViewController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    fileprivate let hud = JGProgressHUD(style: .dark)
    fileprivate let refresh = UIRefreshControl()
    
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        fetchArticle()
        setupRefreshControl()

    }
    
    fileprivate func setupTableView() {
        let nib = UINib(nibName: "ArticlesCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    
    @objc fileprivate func setupRefreshControl() {
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refresh
        } else {
            tableView.addSubview(refresh)
        }
        refresh.addTarget(self, action: #selector(refreshArticle), for: .valueChanged)
    }
    
    @objc fileprivate func refreshArticle() {
        fetchArticle()
    }
    
    fileprivate func fetchArticle() {
        let urlString = APIService.allUrl
        APIService.shared.fetchArticle(urlString: urlString) { (articles) in
            DispatchQueue.main.async {
                self.articles = articles
                self.tableView.reloadData()

            }
            self.hud.dismiss()
            self.refresh.endRefreshing()
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        hud.textLabel.text = "Loading..."
        hud.show(in: v)
        return v
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.articles.count > 0 ? 0 : view.frame.height
    }
    
}






