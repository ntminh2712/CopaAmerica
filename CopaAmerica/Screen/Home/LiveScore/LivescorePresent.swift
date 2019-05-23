//
//  LivescorePresent.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/23/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol LivescorePresent{
    func viewDidLoad()
    var numberOfList: Int {get}
    func setData(cell: LiveScoreTableViewCell, row : Int)
    func setDataList(value:String)
    func setDataHeader(cell: HeaderTableViewCell, row: Int)
    func handlerFavorites(handler: Bool, row: Int)
    func getMatches(row: Int) -> AlarmEntity
    func deleteAlarm(row:Int)
}

class LivescorePresenterImplement: LivescorePresent{
    var view: LivescoreView?
    var livescoreGateway: LivescoreGateway?
    
    var listMatchesToday:[MatchesDetailEntity] = []
    var listMatchesYesterday:[MatchesDetailEntity] = []
    var listMatchesTomorrow:[MatchesDetailEntity] = []
    var listMatches:[MatchesDetailEntity] = []
    
    init(view: LivescoreView,livescoreGateway: LivescoreGateway) {
        self.view = view
        self.livescoreGateway = livescoreGateway
        
    }
    
    var numberOfList: Int{
        return listMatches.count
    }
    
    func viewDidLoad() {
        getLivescore()
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: notificationName.livescore.notification, object: nil)
    }
    
    @objc func reload(){
        setDataList(value: Category.Today)
    }
    
    @objc func setDataList(value:String) {
        switch value {
        case Category.Today:
            listMatches = listMatchesToday
            break
        case Category.Tomorrow :
            listMatches = listMatchesTomorrow
            break
        case Category.Yesterday :
            listMatches = listMatchesYesterday
            break
        default:
            listMatches = listMatchesToday
        }
        self.sortListMatches()
        self.checkListFavorites()
        self.view?.refreshColor(value: value)
        self.view?.refreshtTableView()
    }
    
    func setData(cell: LiveScoreTableViewCell, row : Int){
        cell.setData(item: listMatches[row])
    }
    
    func setDataHeader(cell: HeaderTableViewCell, row: Int) {
        cell.setData(item: listMatches[row])
    }
    func deleteAlarm(row:Int){
        AlarmEntity.deleteMatchesAlarm(listMatches[row].id)
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
    func getMatches(row: Int) -> AlarmEntity {
        let matches = listMatches[row]
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

    func getLivescore() {
        let someDate = Date()
        let myTimeStamp = someDate.timeIntervalSince1970
        livescoreGateway?.getMatches(date: 1560558600, completionHandler: { (result) in
            switch (result){
            case let .success(data):
                for i in 0..<3{
                    self.listMatchesToday += (data.result!.today[i].child_matches)
                    self.listMatchesYesterday += (data.result!.yesterday[i].child_matches)
                    self.listMatchesTomorrow += (data.result!.tomorrow[i].child_matches)
                }
                self.view?.refreshColor(value: Category.Today)
                self.view?.refreshtTableView()
                
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
        var numberOfList:Int = listMatches.count
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
