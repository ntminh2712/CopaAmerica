//
//  GroupViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

protocol GroupView {

    func refreshTbGroup()
}
class GroupViewController: UIViewController,GroupView {
    
    @IBOutlet weak var tbGroup: UITableView!
    
    var presenter: GroupPresent?
    var groupConfig: GroupConfiguaration = GroupConfiguarationImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupConfig.configuration(groupViewController: self)
        presenter?.viewDidLoad()
        tbGroup.delegate = self
        tbGroup.dataSource = self
        tbGroup.register(UINib(nibName: "NameGroupTableViewCell", bundle: nil), forCellReuseIdentifier: "NameGroupTableViewCell")
        tbGroup.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupTableViewCell")
        tbGroup.register(UINib(nibName: "TitleGroupTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleGroupTableViewCell")
    }
    func refreshTbGroup() {
        tbGroup.reloadData()
    }
    
}
extension GroupViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.numberOfList)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row + 6) % 6 == 0 {
            let cell = tbGroup.dequeueReusableCell(withIdentifier: "NameGroupTableViewCell") as! NameGroupTableViewCell
            self.presenter?.setNameGroup(cell: cell,row: indexPath.row)
            cell.showMatches = { [weak self] in
                self?.presenter?.presentDetailGroup(row: indexPath.row)
            }
            return cell
        }else if (indexPath.row + 5) % 6 == 0 {
            let cell = tbGroup.dequeueReusableCell(withIdentifier: "TitleGroupTableViewCell") as! TitleGroupTableViewCell
            return cell
        }else {
            let cell = tbGroup.dequeueReusableCell(withIdentifier: "GroupTableViewCell") as! GroupTableViewCell
            presenter?.setData(cell: cell, row: indexPath.row)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        
    }
    
    
}
