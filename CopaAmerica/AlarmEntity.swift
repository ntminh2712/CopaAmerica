//
//  AlarmEntity.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/25/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import ObjectMapper
class AlarmEntity: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var team_1: String?
    @objc dynamic var team_2: String?
    @objc dynamic var result_team_1: String?
    @objc dynamic var result_team_2: String?
    @objc dynamic var flag_team_1: String?
    @objc dynamic var flag_team_2: String?
    @objc dynamic var timeAlarm: Date?
    @objc dynamic var isFavorites: Bool = false
    @objc dynamic var isAlarm: Bool = false
    @objc dynamic var time: Int = 0
    @objc dynamic var status:Int = 0
    @objc dynamic var enabled: Bool = false
    var mediaLabel: String = "bell"
    var alarms: [AlarmEntity] = []
   
    
//    init(id: Int,team_1: String,team_2: String,result_team_1: String,result_team_2: String,flag_team_1: String,flag_team_2: String,timeAlarm:Date, enabled:Bool){
//        self.id = id
//        self.team_1 = team_1
//        self.team_2 = team_2
//        self.result_team_1 = result_team_1
//        self.result_team_2 = result_team_2
//        self.flag_team_1 = flag_team_1
//        self.flag_team_2 = flag_team_2
//        self.timeAlarm = timeAlarm
//        self.enabled = enabled
//    }
//
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
        alarms = getAlarms()
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
        isAlarm <- map["isAlarm"]
        time <- map["time"]
        enabled <- map["enabled"]
    }
    private func getAlarms() -> [AlarmEntity] {
        return AlarmEntity.getAllAlarm()!
        
    }
    var count: Int {
        return alarms.count
    }
    
}
extension AlarmEntity {
    var formattedTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: self.timeAlarm!)
    }
}

//This can be considered as a viewModel

extension AlarmEntity {
    class func  getAllAlarm()  -> [AlarmEntity]? {
        do {
            let realm = RealmConnectorManager.connectDefault()
            return realm!.objects(AlarmEntity.self).toArray(ofType: AlarmEntity.self)
        } catch let error as NSError {
            Log.debug(message: error.description)
            return nil
        }
    }
    
    class func saveMatchesAlarm(_ alarm: AlarmEntity) {
        do {
            let object:AlarmEntity = AlarmEntity()
            object.id = alarm.id
            object.team_1 = alarm.team_1
            object.team_2 = alarm.team_2
            object.flag_team_1 = alarm.flag_team_1
            object.flag_team_2 = alarm.flag_team_2
            object.result_team_1 = alarm.result_team_1
            object.result_team_2 = alarm.result_team_2
            object.timeAlarm = alarm.timeAlarm
            object.time = alarm.time
            object.isAlarm = alarm.isAlarm
            let realm = RealmConnectorManager.connectDefault()
            guard realm?.object(ofType: AlarmEntity.self, forPrimaryKey: alarm.id) == nil else { return }
            try realm?.write {
                realm?.add(object, update: false)
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
  
    
    class func deleteMatchesAlarm(_  matchesId: Int) {
        do {
            let realm = RealmConnectorManager.connectDefault()
            guard let match = realm?.object(ofType: AlarmEntity.self, forPrimaryKey: matchesId) else { return }
            try realm?.write {
                realm?.delete(match)
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
    class func updateMatchesAlarm(_  matchesId: Int, time: Date, status : Int) {
        do {
            let realm = RealmConnectorManager.connectDefault()
            guard let match = realm?.object(ofType: AlarmEntity.self, forPrimaryKey: matchesId) else { return }
            try realm?.write {
                match.timeAlarm = time
                match.status = status
            }
        } catch let error as NSError {
            Log.debug(message: error.description)
        }
    }
}

