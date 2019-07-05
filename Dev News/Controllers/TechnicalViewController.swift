//
//  TechnicalViewController.swift
//  Dev News
//
//  Created by khoale on 7/4/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD

class TechnicalViewController: GenericTableViewController {
    
    override func fetchArticle() {
        let urlString = APIService.technicalUrl
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






