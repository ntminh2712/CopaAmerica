//
//  FavoritesConfig.swift
//  CopaAmerica
//
//  Created by MinhNT-Mac on 4/9/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol FavoritesConfiguaration: class{
    func configuration(favoritesViewController: FavoritesViewController)
}

class FavoritesConfiguarationImplementation: FavoritesConfiguaration
{
    func configuration(favoritesViewController: FavoritesViewController)
    {
        let presenter = FavoritesPresenterImplement(view: favoritesViewController)
        favoritesViewController.presenter = presenter
    }
}
