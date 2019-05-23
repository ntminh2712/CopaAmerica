//
//  NewConfig.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/10/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol NewsConfiguaration: class{
    func configuration(newsViewController: NewsViewController)
}

class NewsConfiguarationImplementation: NewsConfiguaration
{
    func configuration(newsViewController: NewsViewController)
    {
        let router = NewsViewRouterImplementation(newsViewController: newsViewController)
        let newsGateway = ApiNewsGatewayImplementation()
        let presenter = NewsPresenterImplement(view: newsViewController, router: router, newsGateway: newsGateway, newsController: newsViewController)
        newsViewController.presenter = presenter
    }
}
