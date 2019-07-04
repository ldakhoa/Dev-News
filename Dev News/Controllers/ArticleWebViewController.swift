//
//  ArticleWebViewController.swift
//  Dev News
//
//  Created by khoale on 7/4/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var selectedArticleURL: String?
    
    override func loadView() {
        super.loadView()
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedArticleURL = selectedArticleURL?.replacingOccurrences(of: " ", with: "")
        selectedArticleURL = selectedArticleURL?.replacingOccurrences(of: "\n", with: "")
        webView.load(URLRequest(url: URL(string: selectedArticleURL! as String)!))
        webView.allowsBackForwardNavigationGestures = true
        
    }

}
