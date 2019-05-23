//
//  DetailGrouPresent.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/22/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol DetailGroupPresent{
    func getDetailMatch(date:Int, group:String)
    func viewDidLoad()
    var numberOfList:Int {get}
    func setData(cell:LiveScoreTableViewCell, row: Int)
    func setDataHeader(cell: HeaderTableViewCell,row: Int)
    func getMatches(row:Int) ->AlarmEntity
    func handlerFavorites(handler: Bool,row : Int)
}


class DetailGroupPresenterImplement:LoadingAleart, DetailGroupPresent{
    
    
    var numberOfList: Int {
        return listMatches.count
    }
    
    
    let view: DetailGroupView?
    var matchesGateway: MatchesGateway?
    
    var listMatches:[MatchesDetailEntity] = []
    
    init(view: DetailGroupView,matchesGateway: MatchesGateway) {
        self.view = view
        self.matchesGateway = matchesGateway
    }
    
    
    func viewDidLoad(){
        getDetailMatch(date: 0, group: DataSingleton.GroupDetail!)
    }
    
    func setData(cell: LiveScoreTableViewCell, row: Int) {
        cell.setData(item: listMatches[row])
    }
    func setDataHeader(cell: HeaderTableViewCell,row: Int) {
        cell.setData(item: listMatches[row])
    }
    
    func handlerFavorites(handler: Bool, row: Int) {
        if handler{
            listMatches[row].isFavorites = !listMatches[row].isFavorites
            MatchesDetailEntity.saveMatchesFavorites(listMatches[row])
        }else {
            listMatches[row].isFavorites = !listMatches[row].isFavorites
            MatchesDetailEntity.deleteFavorites(listMatches[row].id)
        }
        
    }
    
    func getMatches(row:Int) ->AlarmEntity {
        let matches = listMatches[row]
        let extractedExpr = AlarmEntity()
        let alarm: AlarmEntity = extractedExpr
        alarm.id = matches.id
        alarm.flag_team_1 = matches.flag_team_1
        alarm.flag_team_2 = matches.flag_team_2
        alarm.team_1 = matches.team_1
        alarm.team_2 = matches.team_2
        alarm.time = matches.time
        alarm.status = matches.status
        return alarm
    }
    
    func getDetailMatch(date:Int, group:String) {
        matchesGateway?.getMatches(date: date, group: group, completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                guard data != nil else { return }
                for item in data.result!.all_day {
                    self.listMatches += item.child_matches
                }
                self.sortListMatches()
                self.checkListFavorites()
                self.view?.refreshTableview()
                break
            case let .failure(error):
                break
            }
        })
    }
    func sortListMatches() {
        guard  listMatches.count != 0 else {
            return
        }
        var numberOfList:Int = listMatches.count + 3
        if numberOfList % 2 != 0 {
            numberOfList += 1
        }
        for i in 0...numberOfList {
            if ((i + 2) % 2) == 0 {
                let emptyObject = MatchesDetailEntity()
                emptyObject.time = listMatches[i].time
                listMatches.insert(emptyObject, at: i)
            }
        }
    }
    func checkListFavorites(){
        let list = MatchesDetailEntity.getAllMatchesFavorites()
        for x in 0 ..< listMatches.count {
            for y in 0 ..< list!.count {
                if list![y].id == listMatches[x].id{
                    listMatches[x].isFavorites = true
                    break
                }else{
                    listMatches[x].isFavorites = false
                }
            }
        }
    }
}
