//
//  CountryGateway.swift
//  FoxLive
//
//  Created by HOANPV on 10/5/18.
//  Copyright © 2018 HOANDHTB. All rights reserved.
//

import Foundation

typealias GetNewsEntityGatewayCompletionHandler  = (_ new: Result<NewsEntity>) -> Void

protocol NewsGateway {
    func getNews(limit:Int, offset: Int,completionHandler: @escaping GetNewsEntityGatewayCompletionHandler)
    
}
