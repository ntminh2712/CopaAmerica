//
//  WallpaperConfig.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/10/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol WallpaperConfiguaration: class{
    func configuration(wallpaperViewController: WallpaperViewController)
}

class WallpaperConfiguarationImplementation: WallpaperConfiguaration
{
    func configuration(wallpaperViewController: WallpaperViewController)
    {
        let wallpaperGateway = ApiWallpaperGatewayImplementation()
        let presenter = WallpaperPresenterImplement(view: wallpaperViewController, wallpaperGateway: wallpaperGateway)
        wallpaperViewController.presenter = presenter
    }
}
