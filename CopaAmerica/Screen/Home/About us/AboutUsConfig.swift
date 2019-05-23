//
//  AboutUsConfig.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/24/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol AboutUsConfiguaration: class{
    func configuration(aboutUsViewController: AboutUsViewController)
}

class AboutUsConfiguarationImplementation: AboutUsConfiguaration
{
    func configuration(aboutUsViewController: AboutUsViewController)
    {
        let apiAboutUs = ApiAboutUsGatewayImplementation()
        let presenter = AboutUsPresenterImplement(view: aboutUsViewController, aboutUsGateway: apiAboutUs as! AboutUsGateway)
        aboutUsViewController.presenter = presenter
    }
}
