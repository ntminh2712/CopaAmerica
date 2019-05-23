//
//  ApiGroupGateway.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiGroupGateway: GroupGateway {
    
}

class ApiGroupGatewayImplementation: ApiGroupGateway
{
    func getListGroup(completionHandler: @escaping GetListGroupGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getListGroup()).asObservable().mapObject(GroupEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    
}
