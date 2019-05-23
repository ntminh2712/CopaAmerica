//
//  ApiAboutUsGateway.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/24/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiAboutUsGateway: AboutUsGateway{
    
}

class ApiAboutUsGatewayImplementation: AboutUsGateway
{
    func getAboutUs(completionHandler: @escaping GetAboutUsGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getAboutUs()).asObservable().mapObject(NewsEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    
}
