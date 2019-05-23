//
//  GroupChildEntity.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
class GroupChildEntity:NSObject, Mappable {
    
    var id: String?
    var name: String?
    var flag: String?
    var played: Int?
    var win: Int?
    var draw: Int?
    var lost: Int?
    var points: Int?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        flag <- map["flag"]
        played <- map["played"]
        win <- map["win"]
        draw <- map["draw"]
        lost <- map["lost"]
        points <- map["points"]
        
    }
    
}
