//
//  AboutUsPresent.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/24/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol AboutUsPresent{
    func viewDidLoad()
}

class AboutUsPresenterImplement: AboutUsPresent{
    
    var view: AboutUsView?
    var aboutUsGateway: AboutUsGateway
    init(view: AboutUsView, aboutUsGateway: AboutUsGateway) {
        self.view = view
        self.aboutUsGateway = aboutUsGateway
    }
    func viewDidLoad() {
        getAboutUs()
    }
    func getAboutUs(){
        aboutUsGateway.getAboutUs { (result) in
            switch result{
            case let .success(data):
                if data != nil {
                    
                    self.view?.loadHtmlCode(data: data.result_AboutUs!)
                }
                break
            case let .failure(error):
                break
            }
        }
    }
}
