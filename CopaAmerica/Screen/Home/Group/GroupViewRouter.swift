//
//  GroupViewRouter.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//
import Foundation
import UIKit
protocol GroupViewRouter: ViewRouter {
    func presentGroupDetail()
}

class GroupViewRouterImplementation: GroupViewRouter {
    fileprivate weak var groupViewController: GroupViewController?
    init(groupViewController: GroupViewController) {
        self.groupViewController = groupViewController
    }
    func presentGroupDetail() {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "groupDetail")
        groupViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
