//
//  HomeConfig.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/9/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol HomeConfiguaration: class{
    func configuration(homeViewController: HomeViewController)
}

class HomeConfiguarationImplementation: HomeConfiguaration
{
    func configuration(homeViewController: HomeViewController)
    {
        let newsGateway = ApiNewsGatewayImplementation()
        let router = HomeViewRouterImplementation(homeViewController: homeViewController)
        let presenter = HomePresenterImplement(view: homeViewController, router: router, homeViewController: homeViewController)
        homeViewController.presenter = presenter
    }
}
