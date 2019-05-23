//
//  GroupConfig.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol GroupConfiguaration: class{
    func configuration(groupViewController: GroupViewController)
}

class GroupConfiguarationImplementation: GroupConfiguaration
{
    func configuration(groupViewController: GroupViewController)
    {
        let api = ApiGroupGatewayImplementation()
        let router = GroupViewRouterImplementation(groupViewController: groupViewController)
        let presenter = GroupPresenterImplement(view: groupViewController, router: router, groupGateway: api)
        groupViewController.presenter = presenter
    }
}
