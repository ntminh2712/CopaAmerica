//
//  TopScorersViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/11/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TopScorersViewController: UIViewController {
    
    @IBOutlet weak var tbTopScorers: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbTopScorers.delegate = self
        tbTopScorers.dataSource = self
        tbTopScorers.register(UINib(nibName: "PlayerTopScoresTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerTopScoresTableViewCell")
        tbTopScorers.register(UINib(nibName: "TitleTopScorersTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleTopScorersTableViewCell")
        
    }

    
    
}
extension TopScorersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tbTopScorers.dequeueReusableCell(withIdentifier: "TitleTopScorersTableViewCell") as! TitleTopScorersTableViewCell
            return cell
        }else {
            let cell = tbTopScorers.dequeueReusableCell(withIdentifier: "PlayerTopScoresTableViewCell") as! PlayerTopScoresTableViewCell
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 85
        }else {
            return 60
        }
        
    }
    
    
}
