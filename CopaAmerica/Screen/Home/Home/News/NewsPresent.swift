//
//  NewsPresent.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/10/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

protocol NewsPresent{
    func presentNewsDetail()
    func viewController()
    func setData(cell: NewsTableViewCell, row:Int)
    var numberOfList: Int {get}
    func setDataSingleton(row: Int)
}

class NewsPresenterImplement:LoadingAleart, NewsPresent{
    
    var listMenu:[MenuEntity] = MenuEntity.initListInformation()
    var listNews: [NewsDetailEntity] = []
    
    let view: NewsView?
    var router: NewsViewRouter?
    var newsGateway: NewsGateway
    var newsController: NewsViewController?
    
    init(view: NewsView, router:NewsViewRouter,newsGateway: NewsGateway,newsController: NewsViewController) {
        self.view = view
        self.router = router
        self.newsGateway = newsGateway
        self.newsController = newsController
    }
    var numberOfList: Int{
        return listNews.count
    }
    
    func setDataSingleton(row: Int) {
        DataSingleton.newsSelect = listNews[row]
    }
    func presentNewsDetail() {
        self.router?.presentNewsDetail()
    }
    func viewController() {
        getNews()
    }
    
    func setData(cell: NewsTableViewCell, row: Int) {
            cell.setDataNews(item: listNews[row])
    }
    
    func getNews() {
        newsGateway.getNews(limit: 1, offset: 0,completionHandler: { (result) in
            switch result {
            case let .success(data):
                self.listNews = data.result
                self.view?.refreshTbNews()
                break
            case let .failure(error):
                self.AlertHepper(title: TitleAlert.error, message: error.localizedDescription, ViewController: self.newsController!)
                break
            }
        })
    }
    
}
