//
//  NewViewRouter.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/10/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol NewsViewRouter: ViewRouter {
    func presentNewsDetail()
}

class NewsViewRouterImplementation: NewsViewRouter {
    fileprivate weak var newsViewController: NewsViewController?
    init(newsViewController: NewsViewController) {
        self.newsViewController = newsViewController
    }
    func presentNewsDetail() {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newsDetail")
        newsViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
