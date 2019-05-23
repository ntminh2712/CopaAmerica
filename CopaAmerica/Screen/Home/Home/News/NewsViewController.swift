//
//  NewsViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/9/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit
protocol NewsView {
    func refreshTbNews()
    
}
class NewsViewController: UIViewController,NewsView {

    @IBOutlet weak var tbNews: UITableView!
    var presenter: NewsPresent?
    var newsConfig: NewsConfiguaration = NewsConfiguarationImplementation()
    override func viewDidLoad() {
        super.viewDidLoad()
        newsConfig.configuration(newsViewController: self)
        presenter?.viewController()
        initTableViewNews()
        
    }
    
    func refreshTbNews() {
        tbNews.reloadData()
    }

    func initTableViewNews() {
        tbNews.delegate = self
        tbNews.dataSource = self
        tbNews.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }

}
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbNews.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        presenter?.setData(cell: cell, row: indexPath.row)
        cell.showDetail = { [weak self] in
            self?.presenter?.setDataSingleton(row: indexPath.row)
            self?.presenter?.presentNewsDetail()
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 365
    }
    
}
