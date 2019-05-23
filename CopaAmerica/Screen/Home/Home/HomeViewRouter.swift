//
//  HomeViewRouter.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/9/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol HomeViewRouter: ViewRouter {
    func presentDetail()
}

class HomeViewRouterImplementation: HomeViewRouter {
    fileprivate weak var homeViewController: HomeViewController?
    init(homeViewController: HomeViewController) {
        self.homeViewController = homeViewController
    }
    func presentDetail() {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "screenDetail")
        homeViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
