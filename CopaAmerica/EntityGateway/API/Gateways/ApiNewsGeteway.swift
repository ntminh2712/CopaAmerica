
//
//  ApiCountryGeteway.swift
//  FoxLive
//
//  Created by HOANPV on 10/5/18.
//  Copyright © 2018 HOANDHTB. All rights reserved.
//

import UIKit

protocol ApiNewsGateway: NewsGateway {
    
}

class ApiNewsGatewayImplementation: ApiNewsGateway
{
    func getNews(limit:Int, offset: Int,completionHandler: @escaping GetNewsEntityGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getNews(limit, offset)).asObservable().mapObject(NewsEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    
}
