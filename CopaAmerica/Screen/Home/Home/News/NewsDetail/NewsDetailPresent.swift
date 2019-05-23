//
//  NewsDetailPresent.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/10/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol NewsDetailPresent{
    func presentNewsDetail()
}

class NewsDetailPresenterImplement: NewsDetailPresent{
    
    var view: NewsDetailView?
    
    init(view: NewsDetailView) {
        self.view = view
    }
    
    func presentNewsDetail() {
    }
}
