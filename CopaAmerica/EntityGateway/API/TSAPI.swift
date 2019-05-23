//
//  TSAPI.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//


import Foundation

enum TSAPI
{
    case getNews(Int?, Int?)
    case getListGroup()
    case getWallpaper(Int?, Int?)
    case getLiveScore(Int?)
    case getMatches(Int?,String?)
    case getAboutUs()
}
 
