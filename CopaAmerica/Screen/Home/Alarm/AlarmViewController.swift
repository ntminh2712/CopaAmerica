//
//  AlarmViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/12/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

protocol AlarmView {
    func refreshTableview()
}

class AlarmViewController: UIViewController,AlarmView {
    
    @IBOutlet weak var tbAlarm: UITableView!
    
    var presenter: AlarmPresent?
    var alarmConfig: AlarmConfiguaration = AlarmConfiguarationImplementation()
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmConfig.configuration(alarmViewController: self)
        presenter?.viewDidLoad()
        tbAlarm.delegate = self
        tbAlarm.dataSource = self
        tbAlarm.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "AlarmTableViewCell")
    }
    
    func refreshTableview() {
        tbAlarm.reloadData()
    }
    
    func setTime(time:String){
        let cell = tbAlarm.dequeueReusableCell(withIdentifier: "AlarmTableViewCell") as! AlarmTableViewCell
        cell.setTextLabel(time: time)
    }
}
extension AlarmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter!.numberOfList
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbAlarm.dequeueReusableCell(withIdentifier: "AlarmTableViewCell") as! AlarmTableViewCell
        presenter?.setData(cell: cell, row: indexPath.row)
        cell.alertCheckDelete = { [weak self] in
            self!.presenter?.alertCheckDelete(row: indexPath.row, controller: self!)
        }
        cell.editAlarm = { [weak self] in
            DataSingleton.MatchesSelect = self!.presenter?.getMatches(row: indexPath.row)
            showPopupEdit(self: self!)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
        
        
    }
    
}
