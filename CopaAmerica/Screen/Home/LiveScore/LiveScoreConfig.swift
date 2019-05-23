
//
//  LiveScoreConfig.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/23/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

protocol LivescoreConfiguaration: class{
    func configuration(livescoreViewController: LivescoreViewController)
}

class LivescoreConfiguarationImplementation: LivescoreConfiguaration
{
    func configuration(livescoreViewController: LivescoreViewController)
    {
        let livescoreGateway = ApiLivescoreGatewayImplementation()
        let presenter = LivescorePresenterImplement(view: livescoreViewController, livescoreGateway: livescoreGateway)
        livescoreViewController.presenter = presenter
    }
}
