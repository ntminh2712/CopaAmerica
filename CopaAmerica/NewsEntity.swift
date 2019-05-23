//
//  NewsEntity.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class NewsEntity:NSObject, Mappable {
    
    var status: Int?
    var code: Int?
    var message: String?
    var result: [NewsDetailEntity] = []
    var result_AboutUs: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
        result_AboutUs <- map["result"]
    }
    
}
