//
//  LivescoreViewController.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/11/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

protocol LivescoreView {
    func refreshtTableView()
    func refreshColor(value:String)
}
class LivescoreViewController: UIViewController,LivescoreView {

    @IBOutlet weak var viewToday: UIView!
    @IBOutlet weak var viewNext: UIView!
    @IBOutlet weak var viewPrevious: UIView!
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var btnToday: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var tbLivescore: UITableView!
    @IBOutlet weak var viewEmpty: UIView!
    var presenter: LivescorePresent?
    var liveScoreConfig: LivescoreConfiguaration = LivescoreConfiguarationImplementation()
    override func viewDidLoad() {
        super.viewDidLoad()
        liveScoreConfig.configuration(livescoreViewController: self)
        presenter?.viewDidLoad()
        setuplayoutButton()
        setupTableivew()
        presenter?.setDataList(value: Category.Today)
        
    }
    func setupTableivew() {
        tbLivescore.delegate = self
        tbLivescore.dataSource = self
        tbLivescore.register(UINib(nibName: "LiveScoreTableViewCell", bundle: nil), forCellReuseIdentifier: "LiveScoreTableViewCell")
        tbLivescore.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        
    }
    
    func setuplayoutButton() {
        viewToday.setLayoutViewOption()
        viewNext.setLayoutViewOption()
        viewPrevious.setLayoutViewOption()
        
    }
    func refreshtTableView() {
        tbLivescore.reloadData()
        if presenter?.numberOfList == 0 {
            viewEmpty.isHidden = false
        }else {
            viewEmpty.isHidden = true
        }
    }
    func refreshColor(value:String) {
        viewPrevious.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewToday.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        viewNext.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnPrevious.setTitleColor(#colorLiteral(red: 0.2858473659, green: 0.2860915363, blue: 0.2858852148, alpha: 1), for: .normal)
        btnToday.setTitleColor(#colorLiteral(red: 0.2858473659, green: 0.2860915363, blue: 0.2858852148, alpha: 1), for: .normal)
        btnNext.setTitleColor(#colorLiteral(red: 0.2858473659, green: 0.2860915363, blue: 0.2858852148, alpha: 1), for: .normal)
        switch value {
        case Category.Yesterday:
            viewPrevious.backgroundColor = #colorLiteral(red: 0.4945881963, green: 0.6848531961, blue: 0.2634083331, alpha: 1)
            btnPrevious.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            break
        case Category.Today:
            viewToday.backgroundColor = #colorLiteral(red: 0.4945881963, green: 0.6848531961, blue: 0.2634083331, alpha: 1)
            btnToday.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            break
        case Category.Tomorrow:
            viewNext.backgroundColor = #colorLiteral(red: 0.4945881963, green: 0.6848531961, blue: 0.2634083331, alpha: 1)
            btnNext.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            break
        default:
            viewToday.backgroundColor = #colorLiteral(red: 0.4945881963, green: 0.6848531961, blue: 0.2634083331, alpha: 1)
            btnToday.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            break
        }
        
        tbLivescore.reloadData()
    }
   
    @IBAction func choosePrevious(_ sender: Any) {
        presenter?.setDataList(value: Category.Yesterday)
    }
    @IBAction func chooseToday(_ sender: Any) {
        presenter?.setDataList(value: Category.Today)
    }
    @IBAction func chooseNext(_ sender: Any) {
        presenter?.setDataList(value: Category.Tomorrow)
    }
    
}
extension LivescoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  ((indexPath.row + 2) % 2) == 0 {
            let cell = tbLivescore.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            presenter?.setDataHeader(cell: cell, row: indexPath.row)
            return cell
            
        }else{
            let cell = tbLivescore.dequeueReusableCell(withIdentifier: "LiveScoreTableViewCell") as! LiveScoreTableViewCell
            presenter?.setData(cell: cell, row: indexPath.row)
            cell.handlerFavorites = {[weak self] in
                self!.presenter?.handlerFavorites(handler: cell.isFavorites, row: indexPath.row)
            }
            cell.handlerAlarm = {[weak self] in
                if cell.isSetAlarm {
                    cell.isSetAlarm = false
                    cell.checkSetAlarm()
                    self!.presenter?.deleteAlarm(row: indexPath.row)
                }
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
