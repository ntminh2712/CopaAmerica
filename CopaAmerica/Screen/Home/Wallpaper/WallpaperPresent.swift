//
//  WallpaperPresent.swift
//  CopaAmerica
//
//  Created by MinhNT on 4/10/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol WallpaperPresent{
    func viewDidLoad()
    var numberOfList: Int {get}
    func setData(cell: WallpaperCollectionViewCell, row : Int)
    func getUrlDownload(row:Int) -> String
}

class WallpaperPresenterImplement: WallpaperPresent{
   
    
    
    var view: WallpaperView?
    var wallpaperGateway: WallpaperGateway?
    
    var listWallpaper:[WallpaperDetailEntity] = []
    
    init(view: WallpaperView,wallpaperGateway: WallpaperGateway) {
        self.view = view
        self.wallpaperGateway = wallpaperGateway
    }
    
    var numberOfList: Int{
        return listWallpaper.count
    }
    
    
    func viewDidLoad() {
        getWallpaper()
    }
    
    func getUrlDownload(row: Int) -> String {
        return listWallpaper[row].url!
    }
    
    func setData(cell: WallpaperCollectionViewCell, row : Int){
        cell.configure(with: listWallpaper[row].url!)
    }
    
    func getWallpaper() {
        wallpaperGateway?.getWallpaper(limit: 10, offset: 0, completionHandler: { (result) in
            switch (result){
            case let .success(data):
                self.listWallpaper = data.result
                self.view?.refreshClWallpaper()
                
                break
            case let .failure(error):
                break
            }
        })
    }
    
}
