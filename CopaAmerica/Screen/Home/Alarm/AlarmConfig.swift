//
//  AlarmConfig.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/25/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol AlarmConfiguaration: class{
    func configuration(alarmViewController: AlarmViewController)
}

class AlarmConfiguarationImplementation: AlarmConfiguaration
{
    func configuration(alarmViewController: AlarmViewController)
    {
        let presenter = AlarmPresenterImplement(view: alarmViewController)
        alarmViewController.presenter = presenter
    }
}
