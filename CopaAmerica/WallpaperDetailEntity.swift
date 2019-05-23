//
//  WallpaperDetailEntity.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class WallpaperDetailEntity:NSObject, Mappable {
    
    var title: String?
    var url: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        url <- map["url"]
    }
    
}
