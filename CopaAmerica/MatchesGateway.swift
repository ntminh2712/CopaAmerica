//
//  MatchesGateway.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/22/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
typealias MatchesGatewayCompletionHandler = (_ matche: Result<MatchesEntity>) -> Void


protocol MatchesGateway {
    func getMatches(date:Int, group: String , completionHandler: @escaping MatchesGatewayCompletionHandler)
}
