//
//  MatchesDetailEntity.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import ObjectMapper
class MatchesDetailEntity: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var team_1: String?
    @objc dynamic var team_2: String?
    @objc dynamic var result_team_1: String?
    @objc dynamic var result_team_2: String?
    @objc dynamic var flag_team_1: String?
    @objc dynamic var flag_team_2: String?
    @objc dynamic var isFavorites: Bool = false
    @objc dynamic var isAlarm: Bool = false
    @objc dynamic var time: Int = 0
    @objc dynamic var status:Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    
    func mapping(map: Map) {
        id <- map["id"]
        team_1 <- map["team_1"]
        team_2 <- map["team_2"]
        time <- map["time"]
        result_team_1 <- map["result_team_1"]
        result_team_2 <- map["result_team_2"]
        flag_team_1 <- map["flag_team_1"]
        flag_team_2 <- map["flag_team_2"]
        isFavorites <- map["isFavorites"]
        isAlarm <- map["isAlarm"]
        time <- map["time"]
    }
    
}
extension MatchesDetailEntity {
    class func  getAllMatchesFavorites()  -> [MatchesDetailEntity]? {
        do {
            let realm = RealmConnectorManager.connectDefault()
            return realm!.objects(MatchesDetailEntity.self).toArray(ofType: MatchesDetailEntity.self)
        } catch let error as NSError {
            Log.debug(message: error.description)
            return nil
        }
    }
    
    class func saveMatchesFavorites(_ matches: MatchesDetailEntity) {
        do {
            let object:MatchesDetailEntity = MatchesDetailEntity()
            object.id = matches.id
            object.team_1 = matches.team_1
            object.team_2 = matches.team_2
            object.flag_team_1 = matches.flag_team_1
            object.flag_team_2 = matches.flag_team_2
            object.result_team_1 = matches.result_team_1
            object.result_team_2 = matches.result_team_2
            object.isFavorites = matches.isFavorites
            object.time = matches.time
            object.isAlarm = matches.isAlarm
            let realm = RealmConnectorManager.connectDefault()
            guard realm?.object(ofType: MatchesDetailEntity.self, forPrimaryKey: matches.id) == nil else { return }
            try realm?.write {
                realm?.add(object, update: false)
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
    class func deleteFavorites(_  matchesId: Int) {
        do {
            let realm = RealmConnectorManager.connectDefault()
            guard let match = realm?.object(ofType: MatchesDetailEntity.self, forPrimaryKey: matchesId) else { return }
            try realm?.write {
                realm?.delete(match)
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
    class func deleteAllFavorites() {
        do {
            let realm = RealmConnectorManager.connectDefault()
            guard let match = realm?.objects(MatchesDetailEntity.self) else { return }
            try realm?.write {
                realm?.delete(match)
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }

}
