//
//  HomePresenter.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/9/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

protocol HomePresent{
    var numberSection:Int{get}
    func setData(cell: MenuTableViewCell, row: Int)
}


class HomePresenterImplement:LoadingAleart, HomePresent{
    
    var listMenu:[MenuEntity] = MenuEntity.initListInformation()
    var newsGateway: NewsGateway?
    let view: HomeView?
    var router: HomeViewRouter?
    var homeViewController: HomeViewController
    
    
    init(view: HomeView, router:HomeViewRouter,homeViewController: HomeViewController) {
        self.view = view
        self.router = router
        self.homeViewController = homeViewController
    }
    var numberSection: Int{
        return listMenu.count
    }
    func setData(cell: MenuTableViewCell, row: Int)
    {
        cell.setData(item: listMenu[row])
    }
    
    
}
