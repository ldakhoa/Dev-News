//
//  Articles.swift
//  Dev News
//
//  Created by khoale on 7/3/19.
//  Copyright © 2019 khoale. All rights reserved.
//

import Foundation

struct Article: Codable {
    var content: String
    let image: String
    var published: String
    var text: String
    var title: String
    var url: String
}

struct Articles: Codable {
    var articles: [Article]
}
