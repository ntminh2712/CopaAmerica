//
//  PopUpViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//
import UIKit
import Foundation
import MediaPlayer
class PopUpViewController: UIViewController {
    
    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var viewSetAlarm: UIView!
    @IBOutlet weak var viewAlarm: UIView!
    @IBOutlet weak var viewOke: UIView!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTimeSetAlarm: UILabel!
    @IBOutlet weak var dpTimeALarm: UIDatePicker!
    @IBOutlet weak var heightViewTime: NSLayoutConstraint!
    @IBOutlet weak var viewTimeAlarm: UIView!
    @IBOutlet weak var viewSave: UIView!
    
    var alarmModel: AlarmEntity = AlarmEntity()
    var alarmScheduler: AlarmSchedulerDelegate = Scheduler()
    var snoozeEnabled: Bool = false
    var enabled: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setlayout()
        hiddenTableTime()
    }
    func setlayout() {
        viewTitle.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 40 , height: 70)
        viewTitle.layer.masksToBounds = false
        viewTitle.roundCorners(corners: [.topRight, .topLeft], radius: 15)
        viewSetAlarm.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 40 , height: 130)
        viewSetAlarm.layer.masksToBounds = false
        viewSetAlarm.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 15)
        viewAlarm.setLayoutViewOption()
        viewOke.layer.cornerRadius = viewOke.frame.height / 2
        viewOke.layer.borderWidth = 1
        viewOke.layer.masksToBounds = false
        viewOke.layer.borderColor = UIColor.clear.cgColor
        viewTimeAlarm.layer.cornerRadius = viewOke.frame.height / 2
        viewTimeAlarm.layer.borderWidth = 1
        viewTimeAlarm.layer.masksToBounds = false
        viewTimeAlarm.layer.borderColor = UIColor.clear.cgColor
        viewSave.layer.cornerRadius = viewOke.frame.height / 2
        viewSave.layer.borderWidth = 1
        viewSave.layer.masksToBounds = false
        viewSave.layer.borderColor = UIColor.clear.cgColor
        setTime()
        
    }
    
    func setTime() {
        lbTime.text = getTimeFromTimeStamp(timeStamp: Double(DataSingleton.MatchesSelect!.time))
        lbName.text  = "\((DataSingleton.MatchesSelect?.team_1)!) - \((DataSingleton.MatchesSelect?.team_2)!)"
        dpTimeALarm.date = NSDate(timeIntervalSince1970: Double(DataSingleton.MatchesSelect!.time)) as Date
    }
    func showTableTime() {
        heightViewTime.constant = 200
        viewTimeAlarm.isHidden = false
        
    }
    func hiddenTableTime() {
        heightViewTime.constant = 0
        viewTimeAlarm.isHidden = true
    }
    @IBAction func saveTime(_ sender: Any) {
        let date = Scheduler.correctSecondComponent(date: dpTimeALarm.date)
        lbTimeSetAlarm.text = date.toString(withFormat: "MMM-dd : hh:mm")
        hiddenTableTime()
       
    }
    @IBAction func showTableTime(_ sender: Any) {
        showTableTime()
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func setAlarm(_ sender: Any) {
        let date = Scheduler.correctSecondComponent(date: dpTimeALarm.date)
        DataSingleton.MatchesSelect?.timeAlarm = date
        DataSingleton.MatchesSelect?.isAlarm = true
        AlarmEntity.saveMatchesAlarm(DataSingleton.MatchesSelect!)
        dismiss(animated: true, completion: nil)
    }
    
}
