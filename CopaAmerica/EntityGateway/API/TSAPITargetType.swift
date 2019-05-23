//
//  TSAPI.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import Foundation


import UIKit
import Moya
import RxSwift
extension TSAPI:TargetType
{
    var baseURL: URL {
        return URL(string: Config.rootUrl)!
    }
    
    var path: String {
        switch self {
        case .getNews: 
            return "/news/list"
        case .getListGroup:
            return "/list-group"
        case .getWallpaper:
            return "/wallpaper/list"
        case .getMatches:
            return "/matches"
        case .getLiveScore:
            return "/matches"
        case .getAboutUs:
            return"/site/about"
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNews,.getListGroup,.getWallpaper,.getMatches:
            return .get
        default:
            return .get
        }
    }
    
    
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .getNews, .getWallpaper, .getMatches, .getLiveScore, .getAboutUs:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    
    var sampleData: Data {
        switch self {
        default:
            guard let url = Bundle.main.url(forResource: "Demo", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        }
    }
    public var parameters: [String : Any]? {
        switch self {
        case .getNews(let limit, let offset):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["limit"] = limit
                parameter["offset"] = offset
                return parameter
            }
            return paramester
        case .getWallpaper(let limit, let offset):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["limit"] = limit
                parameter["offset"] = offset
                return parameter
            }
            return paramester
        case .getMatches(let date, let group):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                if date != 0 {
                    parameter["date"] = date
                }
                parameter["group"] = group
                return parameter
            }
            return paramester
        case .getLiveScore(let date):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["date"] = date
                return parameter
            }
            return paramester
        default:
            return [:]
        }
    }
    var task: Moya.Task {
        return .requestParameters(parameters: self.parameters! , encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        let token = "h8T0DF9yqGKqEooDaoCkAaBL_WVjhm36"
        switch self {
        case  .getNews, .getListGroup, .getWallpaper, .getMatches, .getLiveScore, .getAboutUs:
            var header: [String:String]?{
                var header: [String:String] = [:]
                header["Authorization"] = "Bearer \(token)"
                return header
            }
            return header
        default:
            return [:]
        }
        return [:]
    }
    
    
    
}

