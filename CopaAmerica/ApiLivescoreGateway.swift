//
//  ApiLivescoreGateway.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/23/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiLivescoreGateway: LivescoreGateway{
    
}

class ApiLivescoreGatewayImplementation: ApiLivescoreGateway
{
    
    func getMatches(date: Int, completionHandler: @escaping MatchesGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getLiveScore(date)).asObservable().mapObject(MatchesEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
}
