//
//  DetailEntity.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
class DetailEntity:NSObject, Mappable {
    
    var id: String?
    var name: String?
    var child: [GroupChildEntity] = []
    var child_matches: [MatchesDetailEntity] = []
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        child <- map["child"]
        child_matches <- map["child"]
        
    }
    
}
