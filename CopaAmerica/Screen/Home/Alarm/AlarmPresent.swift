//
//  AlarmPresent.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/25/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit

protocol AlarmPresent{
    func viewDidLoad()
    var numberOfList: Int {get}
    func setData(cell: AlarmTableViewCell, row: Int)
    func getMatches(row: Int) -> AlarmEntity
    func alertCheckDelete(row:Int,controller: UIViewController)
}

class AlarmPresenterImplement: AlarmPresent{
    
    var listAlarm:[AlarmEntity] = []
    var view: AlarmView?
    var numberOfList: Int {
        return listAlarm.count
    }
    
    init(view: AlarmView) {
        self.view = view
    }
    func viewDidLoad() {
        getAlarm()
        NotificationCenter.default.addObserver(self, selector: #selector(getAlarm), name:notificationName.getAlarm.notification, object: nil)
    }
    
    
    @objc func getAlarm() {
        listAlarm = AlarmEntity.getAllAlarm()!
        self.view?.refreshTableview()
        
    }
    func alertCheckDelete(row:Int,controller: UIViewController) {
        let alert = UIAlertController(title: "Are you sure to delete?", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            AlarmEntity.deleteMatchesAlarm(self.listAlarm[row].id)
            self.getAlarm()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        controller.present(alert, animated: true)
    }
    
    
    func setData(cell: AlarmTableViewCell, row: Int) {
        cell.setData(item: listAlarm[row])
    }
    
    func getMatches(row: Int) -> AlarmEntity {
        return listAlarm[row]
    }
    
}
