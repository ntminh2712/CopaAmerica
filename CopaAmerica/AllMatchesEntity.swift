//
//  AllMatchesEntity.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/22/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class AllMatchesEntity:NSObject, Mappable {
    var all_day: [DetailEntity] = []
    var yesterday: [DetailEntity] = []
    var today: [DetailEntity] = []
    var tomorrow: [DetailEntity] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        all_day <- map["all_day"]
        yesterday <- map["yesterday"]
        today <- map["today"]
        tomorrow <- map["tomorrow"]
    }
    
}
