//
//  AlarmSchedulerDelegate.swift
//  Alarm-ios-swift
//
//  Created by natsu1211 on 2017/02/01.
//  Copyright © 2017年 LongGames. All rights reserved.
//

import Foundation
import UIKit

protocol AlarmSchedulerDelegate {
    func setupNotificationSettings() -> UIUserNotificationSettings
    func checkNotification()
}

