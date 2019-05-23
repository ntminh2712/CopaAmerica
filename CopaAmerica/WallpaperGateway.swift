//
//  WallpaperGateway.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

typealias GetWallpaperGatewayCompletionHandler = (_ books: Result<WallpaperEntity>) -> Void


protocol WallpaperGateway {
    func getWallpaper(limit:Int, offset: Int,completionHandler: @escaping GetWallpaperGatewayCompletionHandler)
}
