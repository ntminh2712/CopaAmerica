//
//  GroupDetail.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class GroupDetailEntity:NSObject, Mappable {
    
    var Group: [DetailEntity] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        Group <- map["Group"]
    }
    
}
