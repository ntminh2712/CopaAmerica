//
//  Define.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
struct SegueIdentifier {
    //Explore
    static let goPlayLitsController = "goPlayLitsController"
    static let goListStory = "goListStory"
}

struct ControllerIdentifier {
    //Login
    static let navigationLogin = "navigationLogin"
    
}
struct DateFormat {
    static let yyyyssDash = "yyyy-MM-dd'T'HH:mm:ss"
    static let ddmmSlash = "dd/MM/yyyy HH:mm"
    static let ddMMyyyy = "dd/MM/yyyy"
    static let MMyyyy = "MM/yyyy"
    static let yyyyMMdd = "yyyy/MM/dd"
    static let yyyymsDash = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    static let yyyymsZDash = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    static let HHmm = "HH:mm"
    static let slashddmmyy = "HH:mm dd/MM/yyyy"
    static let yyyymdHmsZ = "yyyy-MM-dd HH:mm:ss ZZZ"
    static let yyyyMdHms = "yyyy/MM/dd HH:mm:ss"
    static let ddMMMMyyyy = "dd MMMM','yyyy"
    static let yyyyMMddHHmmss = "yyyyMMddHHmmss"
}


struct Category {
    static let Yesterday:String = "Yesterday"
    static let Today:String = "Today"
    static let Tomorrow:String = "Tomorrow"
}

enum notificationName: String {
    //Login
    case home = "home"
    case myLibrary = "myLibrary"
    case downloadSuccess = "downloadSuccess"
    case updateProgress = "updateProgress"
    case getFavorites = "getFavorites"
    case livescore = "livescore"
    case getAlarm = "getAlarm"
    var notification: NSNotification.Name{
        return Notification.Name(rawValue: self.rawValue)
    }
}
struct Admod {
    static let banner = "ca-app-pub-3646407986539386/7164932517"
    static let interstitial =  "ca-app-pub-3646407986539386/4666761685"
    static let id = "ca-app-pub-3646407986539386~1142325930"
    static let Rewarded = "ca-app-pub-3646407986539386/6718209950"
}
struct SocialNetWorking {
    static let linkDownLoadApp = "kolorfoxstudio@gmail.com"
    static let contentShare = ""
    static let emailKolorFox = "kolorfoxstudio@gmail.com"
}
struct Menu {
    static let home = "Coppa Americal 2019"
    static let favorites = "Favorites"
    static let livescore = "LiveScore"
    static let wallpaper = "Wallpaper"
    static let settings = "Settings"
    static let alarm = "Alarm"
    static let topScorers = "Top Scorers"
    static let group = "Group"
    static let giveFeedBack = "Give me feedback"
    static let aboutUs = "About Us"
}

struct TitleAlert {
    static let success = "Success !"
    static let error = "Error !"
    static let message = "Message !"
    static let _continue = "Continue"
    static let  _cancel = "Cancel"
    static let unavilable = "Unavilable !"
    static let ok = "Ok"
    static let servicesAvailable = "Mail services are not available"
}

enum segmented{
    static let AllStory:Int = 0
    static let SubCategory: Int = 1
}

struct Format {
    public static var FORMAT_HTML = "FORMAT_HTML"
    public static var FORMAT_EPUB_IMAGE = "FORMAT_EPUB_IMAGE"
    public static var FORMAT_EPUB = "FORMAT_EPUB"
    public static var FORMAT_KINDLE = "FORMAT_KINDLE"
    public static var FORMAT_TEXT = "FORMAT_TEXT"
}

struct CodeResponse  {
    public static var success: Int = 200
    public static var failure: Int = 400
}
struct Id {
    static let stopIdentifier = "Alarm-ios-swift-stop"
    static let snoozeIdentifier = "Alarm-ios-swift-snooze"
    static let addSegueIdentifier = "addSegue"
    static let editSegueIdentifier = "editSegue"
    static let saveSegueIdentifier = "saveEditSegue"
    static let soundSegueIdentifier = "soundSegue"
    static let labelSegueIdentifier = "labelEditSegue"
    static let weekdaysSegueIdentifier = "weekdaysSegue"
    static let settingIdentifier = "setting"
    static let musicIdentifier = "musicIdentifier"
    static let alarmCellIdentifier = "alarmCell"
    
    static let labelUnwindIdentifier = "labelUnwindSegue"
    static let soundUnwindIdentifier = "soundUnwindSegue"
    static let weekdaysUnwindIdentifier = "weekdaysUnwindSegue"
}


class DataSingleton
{
    public static var newsSelect: NewsDetailEntity?
    public static var GroupDetail: String?
    public static var MatchesSelect: AlarmEntity?
}
func getDateFromTimeStamp(timeStamp : Double) -> String {
    let date = NSDate(timeIntervalSince1970: timeStamp)
    let dayTimePeriodFormatter = DateFormatter()
    dayTimePeriodFormatter.dateFormat = "MMM dd , YYYY"
    let dateString = dayTimePeriodFormatter.string(from: date as Date)
    return dateString
}
func getTimeFromTimeStamp(timeStamp : Double) -> String {
    let date = NSDate(timeIntervalSince1970: timeStamp)
    let dayTimePeriodFormatter = DateFormatter()
    dayTimePeriodFormatter.dateFormat = "hh:mm"
    let dateString = dayTimePeriodFormatter.string(from: date as Date)
    return dateString
}
func getTimeDateFromTimeStamp(timeStamp : Double) -> String {
    let date = NSDate(timeIntervalSince1970: timeStamp)
    let dayTimePeriodFormatter = DateFormatter()
    dayTimePeriodFormatter.dateFormat = "MMM dd, hh:mm"
    let dateString = dayTimePeriodFormatter.string(from: date as Date)
    return dateString
}


func showPopupEdit(self: UIViewController) {
    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popupAlarm") as! PopUpViewController
    popOverVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    self.present(popOverVC, animated: false)
}


