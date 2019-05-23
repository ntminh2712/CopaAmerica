//
//  LivescoreGateway.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/23/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

protocol LivescoreGateway {
    func getMatches(date:Int , completionHandler: @escaping MatchesGatewayCompletionHandler)
}
