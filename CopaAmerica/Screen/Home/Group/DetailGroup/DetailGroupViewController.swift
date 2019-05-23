//
//  DetailGroupViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit
protocol DetailGroupView {
    func refreshTableview()
}

class DetailGroupViewController: UIViewController,DetailGroupView {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var tbDetailGroup: UITableView!
    
    var presenter: DetailGroupPresent?
    var detailGroupConfig: DetailGroupConfiguaration = DetailGroupConfiguarationImplementation()
    override func viewDidLoad() {
        super.viewDidLoad()
        detailGroupConfig.configuration(detailGroupViewController: self)
        presenter?.viewDidLoad()
        tbDetailGroup.delegate = self
        tbDetailGroup.dataSource = self
        tbDetailGroup.register(UINib(nibName: "LiveScoreTableViewCell", bundle: nil), forCellReuseIdentifier: "LiveScoreTableViewCell")
        tbDetailGroup.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        lbName.text = DataSingleton.GroupDetail
    }
    
    func refreshTableview() {
        tbDetailGroup.reloadData()
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DetailGroupViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  ((indexPath.row + 2) % 2) == 0 {
            let cell = tbDetailGroup.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            presenter?.setDataHeader(cell: cell, row: indexPath.row)
            return cell
            
        }else{
            let cell = tbDetailGroup.dequeueReusableCell(withIdentifier: "LiveScoreTableViewCell") as! LiveScoreTableViewCell
            presenter?.setData(cell: cell, row: indexPath.row)
            
            cell.handlerFavorites = {[weak self] in
                self!.presenter?.handlerFavorites(handler: cell.isFavorites, row: indexPath.row)
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
