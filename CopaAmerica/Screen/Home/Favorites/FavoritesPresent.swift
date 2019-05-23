//
//  FavoritesPresent.swift
//  CopaAmerica
//
//  Created by MinhNT-Mac on 4/9/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol FavoritesPresent{
    func viewDidLoad()
    var numberOfList: Int {get}
    func setData(cell: LiveScoreTableViewCell, row: Int)
    func handlerFavorites(row:Int)
    func getMatches(row: Int) -> AlarmEntity
    func setDataHeader(cell:HeaderTableViewCell, row: Int)
}
var listFavorites:[MatchesDetailEntity] = []
class FavoritesPresenterImplement: FavoritesPresent{
    
    
    var view: FavoritesView?
    var numberOfList: Int {
        return listFavorites.count
    }
    
    init(view: FavoritesView) {
        self.view = view
    }
    func viewDidLoad() {
        getFavorites()
        NotificationCenter.default.addObserver(self, selector: #selector(getFavorites), name:notificationName.getFavorites.notification, object: nil)
    }
    
    
    @objc func getFavorites() {
        listFavorites = MatchesDetailEntity.getAllMatchesFavorites()!
        sortlistFavorites()
        self.view?.refreshTableview()
        
    }
    
    func setData(cell: LiveScoreTableViewCell, row: Int) {
        cell.setData(item: listFavorites[row])
    }
    
    func setDataHeader(cell: HeaderTableViewCell, row: Int) {
        cell.setData(item: listFavorites[row])
    }
    
    func handlerFavorites(row:Int){
        MatchesDetailEntity.deleteFavorites(listFavorites[row].id)
        listFavorites = MatchesDetailEntity.getAllMatchesFavorites()!
        sortlistFavorites()
        self.view?.refreshTableview()
    }
    func getMatches(row: Int) -> AlarmEntity {
        let matches = listFavorites[row]
        let alarm = AlarmEntity()
        alarm.id = matches.id
        alarm.flag_team_1 = matches.flag_team_1
        alarm.flag_team_2 = matches.flag_team_2
        alarm.team_1 = matches.team_1
        alarm.team_2 = matches.team_2
        alarm.time = matches.time
        alarm.status = matches.status
        return alarm
    }
    
    func sortlistFavorites(){
        guard listFavorites.count != 0 else {
            return
        }
        let numberSort:Int = listFavorites.count
        for i in 0..<numberSort * 2 {
            if ((i + 2) % 2) == 0 {
                let emptyObject = MatchesDetailEntity()
                emptyObject.time = listFavorites[i].time
                listFavorites.insert(emptyObject, at: i)
            }
        }
    }
}
