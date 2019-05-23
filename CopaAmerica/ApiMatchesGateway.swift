//
//  ApiMatchesGateway.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/22/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiMatchesGateway: MatchesGateway{
    
}

class ApiMatchesGatewayImplementation: ApiMatchesGateway
{
    func getMatches(date: Int, group: String, completionHandler: @escaping MatchesGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getMatches(date,group)).asObservable().mapObject(MatchesEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
}
