//
//  NewsDetailViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/10/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit
protocol NewsDetailView {
    
    
}

class NewsDetailViewController: UIViewController,NewsDetailView {

    var presenter: NewsDetailPresent?
    var newsDetailConfig: NewsDetailConfiguaration = NewsDetailConfiguarationImplementation()
    @IBOutlet weak var webviewContent: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsDetailConfig.configuration(newsDetailViewController: self)
        loadHtmlCode()
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
    func loadHtmlCode() {
        activityStart()
        webviewContent.loadHTMLString((DataSingleton.newsSelect?.content)!, baseURL: nil)
        activityStop()
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
