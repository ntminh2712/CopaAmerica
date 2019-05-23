//
//  SettingsViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/10/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var imgVibrate: UIImageView!
    var isVibrate:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func handlerSwitchVibrate(_ sender: Any) {
        isVibrate = !isVibrate
        if isVibrate {
            imgVibrate.image = UIImage(named: "icon_switch_on")
        }else {
            imgVibrate.image = UIImage(named: "icon_switch_off")
        }
        
    }
    
}
