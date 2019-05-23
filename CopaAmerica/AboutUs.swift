//
//  AboutUs.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/24/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
typealias GetAboutUsGatewayCompletionHandler  = (_ about_us: Result<NewsEntity>) -> Void

protocol AboutUsGateway {
   func getAboutUs(completionHandler: @escaping GetAboutUsGatewayCompletionHandler)
}
