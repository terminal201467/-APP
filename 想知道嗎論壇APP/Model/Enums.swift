//
//  Model.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import Foundation

enum SideMenuName:Int,CaseIterable{
    case xiangZhiDaoMa = 0
    var title:String{
        switch self {
        case .xiangZhiDaoMa: return "想知道嗎"
        }
    }
    var logoName:String{
        switch self {
        case .xiangZhiDaoMa: return "brain"
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

enum CellLogo:Int,CaseIterable{
    case thumb = 0,thumbFill,bookmark,bookMarkFill,message,messageFill
    var logo:String{
        switch self {
        case .thumb:         return "hand.thumbsup"
        case .thumbFill:     return "hand.thumbsup.fill"
        case .bookmark:      return "bookmark"
        case .bookMarkFill:  return "bookmark.fill"
        case .message:       return "message"
        case .messageFill:   return "message.fill"
        }
    }
    
}


