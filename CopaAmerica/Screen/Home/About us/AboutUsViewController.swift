//
//  AboutUsViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/24/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit
protocol AboutUsView {
    func loadHtmlCode(data: String)
    
}
class AboutUsViewController: UIViewController , AboutUsView{
    
    @IBOutlet weak var wvAboutUs: UIWebView!
    
    var presenter: AboutUsPresent?
    var aboutUsConfig: AboutUsConfiguaration = AboutUsConfiguarationImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutUsConfig.configuration(aboutUsViewController: self)
        presenter?.viewDidLoad()
    
    }
    
    
    let activity:UIActivityIndicatorView = UIActivityIndicatorView()
    func activityStart(){
        activity.center = self.view.center
        activity.hidesWhenStopped = true
        activity.style = UIActivityIndicatorView.Style.white
        self.view.addSubview(activity)
        activity.startAnimating()
    }
    func activityStop(){
        activity.stopAnimating()
    }
    func loadHtmlCode(data: String) {
        activityStart()
        wvAboutUs.loadHTMLString(data, baseURL: nil)
        activityStop()
    }
}
