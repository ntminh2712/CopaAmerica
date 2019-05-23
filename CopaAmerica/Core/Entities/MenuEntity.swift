//
//  MenuEntity.swift
//  Library
//
//  Created by Cosmin Stirbu on 2/23/17.
//  MIT License
//
//  Copyright (c) 2017 Fortech
//
import UIKit

class MenuEntity: NSObject {
    var name: String?
    var icon: String?
    var isSelected: Bool = false
    
    override init() {
        
    }
    init(_name: String, _icon: String, _isSelect: Bool = false)
    {
        self.name = _name
        self.icon = _icon
        self.isSelected = _isSelect
    }
    
    public static func initListInformation() -> [MenuEntity]
    {
        var list = [MenuEntity]()
        
        var item = MenuEntity(_name: "Home", _icon: "icon_menu_home")
        list.append(item)
        
        item = MenuEntity(_name: "Group", _icon: "icon_menu_group")
        list.append(item)
        
        item = MenuEntity(_name: "Favorites", _icon: "icon_menu_favorites")
        list.append(item)
        
        item = MenuEntity(_name: "Alarm", _icon: "icon_menu_alarm")
        list.append(item)
        item = MenuEntity(_name: "Livescore", _icon: "icon_menu_livescore")
        list.append(item)
        
        item = MenuEntity(_name: "TopScorers", _icon: "icon_menu_top_scorers")
        list.append(item)
        
        item = MenuEntity(_name: "Wallpaper", _icon: "icon_menu_wallpaper")
        list.append(item)
        
        item = MenuEntity(_name: "Settings", _icon: "icon_menu_settings")
        list.append(item)
        
        item = MenuEntity(_name: "Rate our app", _icon: "icon_menu_rate_app")
        list.append(item)
        
        item = MenuEntity(_name: "Give us feedback", _icon: "icon_menu_feedback")
        list.append(item)
        
        item = MenuEntity(_name: "About us", _icon: "icon_menu_about_us")
        list.append(item)
        
        return list
    }
}
