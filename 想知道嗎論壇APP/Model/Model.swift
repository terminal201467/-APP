//
//  Model.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import Foundation

enum SideMenuName:Int,CaseIterable{
    case xiangZhiDaoMa = 0,chiTa
    var title:String{
        switch self {
        case .xiangZhiDaoMa: return "想知道嗎"
        case .chiTa:         return "其他"
        }
    }
    var logoName:String{
        switch self {
        case .xiangZhiDaoMa: return "sun.min.fill"
        case .chiTa:         return "sparkles"
        }
    }
}

enum MenuPageName:Int,CaseIterable{
    case bulletin = 0,xiangZhiDao,chaoWuan
    var title:String{
        switch self {
        case .bulletin:    return "公告欄"
        case .xiangZhiDao: return "想知道嗎"
        case .chaoWuan:    return "敲碗想知道"
        }
    }
}

enum SegmentedTitle:Int,CaseIterable{
    case article = 0,calender
    var title:String{
        switch self {
        case .article:  return "文章"
        case .calender: return "日曆"
        }
    }
}

enum ColorManage:Int,CaseIterable{
    case darkGreen = 0, green, lightGreen, whitegreen, darkGray, brown, black, white
    var color:String{
        switch self {
        case .darkGreen:  return "#66A374"
        case .green:      return "#79BC89"
        case .lightGreen: return "#7DD0A4"
        case .whitegreen: return "#96EABD"
        case .darkGray:   return "#5B5B5B"
        case .brown:      return "#77625C"
        case .black:      return "#000000"
        case .white:      return "#FFFFFF"
        }
    }
}


