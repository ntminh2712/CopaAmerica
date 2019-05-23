//
//  GroupGateway.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
typealias GetListGroupGatewayCompletionHandler  = (_ group: Result<GroupEntity>) -> Void

protocol GroupGateway {
    func getListGroup(completionHandler: @escaping GetListGroupGatewayCompletionHandler)
    
}
