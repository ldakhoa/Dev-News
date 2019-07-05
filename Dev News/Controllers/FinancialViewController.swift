//
//  FinancialViewController.swift
//  Dev News
//
//  Created by khoale on 7/4/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import UIKit

class FinancialViewController: GenericTableViewController {
    
    override func fetchArticle() {
        let urlString = APIService.financialUrl
        APIService.shared.fetchArticle(urlString: urlString) { (articles) in
            DispatchQueue.main.async {
                self.articles = articles
                self.tableView.reloadData()
            }
            self.hud.dismiss()
            self.refreshControl?.endRefreshing()
        }
    }
    
}
