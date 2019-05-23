//
//  DetailGroupConfig.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/22/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol DetailGroupConfiguaration: class{
    func configuration(detailGroupViewController: DetailGroupViewController)
}

class DetailGroupConfiguarationImplementation: DetailGroupConfiguaration
{
    func configuration(detailGroupViewController: DetailGroupViewController){
        let apiMatches = ApiMatchesGatewayImplementation()
        let presenter = DetailGroupPresenterImplement(view: detailGroupViewController, matchesGateway: apiMatches)
        detailGroupViewController.presenter = presenter
    }
}
