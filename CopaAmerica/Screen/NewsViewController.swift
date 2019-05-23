//
//  NewsViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/9/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tbNews: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableViewNews()
        // Do any additional setup after loading the view.
    }
    

    func initTableViewNews() {
        tbNews.delegate = self
        tbNews.dataSource = self
        tbNews.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }

}
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbNews.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 365
    }
    
}
