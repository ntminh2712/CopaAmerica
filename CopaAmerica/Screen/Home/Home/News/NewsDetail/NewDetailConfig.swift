//
//  NewDetailConfig.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/10/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol NewsDetailConfiguaration: class{
    func configuration(newsDetailViewController: NewsDetailViewController)
}

class NewsDetailConfiguarationImplementation: NewsDetailConfiguaration
{
    func configuration(newsDetailViewController: NewsDetailViewController)
    {
        let presenter = NewsDetailPresenterImplement(view: newsDetailViewController)
        newsDetailViewController.presenter = presenter
    }
}
