//
//  NewsDetailEntity.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class NewsDetailEntity:NSObject, Mappable {
    
    var id: Int?
    var title: String?
    var slug: String?
    var featured_image: String?
    var content: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        slug <- map["slug"]
        featured_image <- map["featured_image"]
        content <- map["content"]
    }
    
}
