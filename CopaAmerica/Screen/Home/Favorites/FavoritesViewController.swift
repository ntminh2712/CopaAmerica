//
//  FavoritesViewController.swift
//  CopaAmerica
//
//  Created by MinhNT-Mac on 4/9/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit
protocol FavoritesView {
    func refreshTableview()
}
class FavoritesViewController: UIViewController,FavoritesView {
    
    @IBOutlet weak var tbFavorites: UITableView!
    var presenter: FavoritesPresent?
    var favoritesConfig: FavoritesConfiguaration = FavoritesConfiguarationImplementation()
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesConfig.configuration(favoritesViewController: self)
        presenter?.viewDidLoad()
        tbFavorites.delegate = self
        tbFavorites.dataSource = self
        tbFavorites.register(UINib(nibName: "LiveScoreTableViewCell", bundle: nil), forCellReuseIdentifier: "LiveScoreTableViewCell")
        tbFavorites.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
    }
    
    func refreshTableview() {
        tbFavorites.reloadData()
    }
    
}
extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  ((indexPath.row + 2) % 2) == 0 {
            let cell = tbFavorites.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            presenter?.setDataHeader(cell: cell, row: indexPath.row)
            return cell
        }else{
            let cell = tbFavorites.dequeueReusableCell(withIdentifier: "LiveScoreTableViewCell") as! LiveScoreTableViewCell
            presenter?.setData(cell: cell, row: indexPath.row)
            cell.isFavorites = true
            cell.checkFavorites()
            cell.handlerFavorites = {[weak self] in
                self!.presenter?.handlerFavorites(row:indexPath.row)
            }
            cell.handlerAlarm = {[weak self] in
                DataSingleton.MatchesSelect = self!.presenter?.getMatches(row: indexPath.row)
                showPopupEdit(self: self!)
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}
