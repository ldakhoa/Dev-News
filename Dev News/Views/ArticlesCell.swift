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

            print(article.published)

            pubDateLabel.text = self.getFormatedDate(date_string: article.published, dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSSSS")

            if let url = URL(string: article.image) {
                articleImageView.sd_setImage(with: url, completed: nil)
            }
            
        }
    }
    
    func getFormatedDate(date_string: String, dateFormat: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        dateFormatter.dateFormat = dateFormat
        
        let dateFromInputString = dateFormatter.date(from: date_string)
        dateFormatter.dateFormat = "MMMM yyyy HH:MM"
        
        if dateFromInputString != nil {
            return dateFormatter.string(from: dateFromInputString!)
        } else {
            debugPrint("could not convert date")
            return "N/A"
        }
    }
    
}
