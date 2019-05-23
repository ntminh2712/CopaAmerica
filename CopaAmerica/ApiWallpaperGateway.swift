//
//  ApiWallpaperGateway.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiWallpaper: WallpaperGateway{
    
}

class ApiWallpaperGatewayImplementation: ApiWallpaper
{
    func getWallpaper(limit:Int, offset: Int,completionHandler: @escaping GetWallpaperGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getWallpaper(limit, offset)).asObservable().mapObject(WallpaperEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
}
