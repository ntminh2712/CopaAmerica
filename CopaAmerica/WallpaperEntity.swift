//
//  WallpaperEntity.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class WallpaperEntity:NSObject, Mappable {
    
    var status: Int?
    var code: Int?
    var message: String?
    var result: [WallpaperDetailEntity] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
    
}
