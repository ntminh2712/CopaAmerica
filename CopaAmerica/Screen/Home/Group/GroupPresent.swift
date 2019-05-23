//
//  GroupPresent.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/16/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//
import Foundation

protocol GroupPresent{
    func presentDetailGroup(row:Int)
    func viewDidLoad()
    var numberOfList: Int {get}
    func setData(cell: GroupTableViewCell,row:Int)
    func setNameGroup(cell: NameGroupTableViewCell, row:Int)
}

class GroupPresenterImplement: GroupPresent{
    var numberOfList: Int {
        return listGroup.count
    }
    
    
    var listGroup: [GroupChildEntity] = []
    var listNameGroup:[DetailEntity] = []
    
    let view: GroupView?
    let router: GroupViewRouter?
    let groupGateway: GroupGateway?
    var indexOfListChild: Int = 0
    var countOfListGroup: Int = 0
    var indexOfGroup: Int = 0
    var isSetGroup:Bool = true
    var isSetName:Bool = true
    var data:GroupEntity?
    init(view: GroupView, router: GroupViewRouter, groupGateway: GroupGateway) {
        self.view = view
        self.router = router
        self.groupGateway = groupGateway
    }
    
    func viewDidLoad() {
        getListGroup()
    }
    func presentDetailGroup(row:Int) {
        DataSingleton.GroupDetail = listGroup[row].id
        self.router?.presentGroupDetail()
    }
    
    func setData(cell: GroupTableViewCell, row:Int) {
        guard listNameGroup.count != 0 else {return}
        if  listGroup[row] != nil{
            cell.setData(item: listGroup[row])
        }
        
        
    } 
    
    func setNameGroup(cell: NameGroupTableViewCell, row:Int){
        if listNameGroup.count != 0 {
            cell.lbName.text = listGroup[row].name
        }
        
    }
    
    
    func getListGroup() {
        groupGateway?.getListGroup(completionHandler: { (result) in
            switch (result){
            case let .success(data):
                self.data = data
                if data != nil {
                    self.listNameGroup = data.result!.Group
                    for item in (self.data?.result?.Group)!{
                        self.listGroup += item.child
                        
                    }
                }
                self.sortListGroup()
                self.view?.refreshTbGroup()
                break
            case let .failure(error):
                
                break
            }
        })
    }
    func sortListGroup(){
        var indexInsert = 0
        
        for i in 0...(listGroup.count + 1){
            if (i + 6) % 6 == 0{
                let emptyObject = GroupChildEntity()
                emptyObject.name = listNameGroup[indexInsert].name
                emptyObject.id = listNameGroup[indexInsert].id
                listGroup.insert(emptyObject, at: i)
                indexInsert += 1
            }else if (i + 5) % 6 == 0 {
                let emptyObject = GroupChildEntity()
                listGroup.insert(emptyObject, at: i)
            }
           
        }
    }
}
