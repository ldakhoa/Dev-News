//
//  ArticlesCell.swift
//  Dev News
//
//  Created by khoale on 7/4/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import UIKit
import SDWebImage

class ArticlesCell: UITableViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 2
        }
    }
    
    var article: Article! {
        didSet {
            titleLabel.text = article.title
            descriptionLabel.text = article.text

            let dateString = getDate(date: article.published)
            let timePeriod = dateString?.relativeTime
            let pubDateString = String(timePeriod ?? "")
            showOutputSource(article: article, pubDate: pubDateString)

            if let url = URL(string: article.image) {
                articleImageView.sd_setImage(with: url, completed: nil)
            }
            
        }
    }

    fileprivate func showOutputSource(article: Article, pubDate: String) {
        switch article.url {
        case let str where str.contains("tuoitre"):
            pubDateLabel.text = "tuoitre.vn in \(pubDate)"
        case let str where str.contains("tinhte"):
            pubDateLabel.text = "tinhte.vn in \(pubDate)"
        case let str where str.contains("vnexpress"):
            pubDateLabel.text = "vnexpress.net in \(pubDate)"
            
        case let str where str.contains("reddit"):
            pubDateLabel.text = "reddit.com in \(pubDate)"
        case let str where str.contains("feedburner"):
            pubDateLabel.text = "feedburner.com in \(pubDate)"
        case let str where str.contains("ycombinator"):
            pubDateLabel.text = "news.ycombinator.com in \(pubDate)"
        case let str where str.contains("arstechnica"):
            pubDateLabel.text = "arstechnica.com/ in \(pubDate)"
        case let str where str.contains("theverge"):
            pubDateLabel.text = "theverge.com in \(pubDate)"
        case let str where str.contains("engadget"):
            pubDateLabel.text = "engadget.com in \(pubDate)"
        case let str where str.contains("wired"):
            pubDateLabel.text = "wired.com in \(pubDate)"
        case let str where str.contains("thenextweb"):
            pubDateLabel.text = "thenextweb.com in \(pubDate)"
        case let str where str.contains("theonion"):
            pubDateLabel.text = "theonion.com in \(pubDate)"
        case let str where str.contains("reuters"):
            pubDateLabel.text = "reuters.com in \(pubDate)"
        default:
            Void()
        }
    }

    fileprivate func getDate(date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: date)
    }
    
}
