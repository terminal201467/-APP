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
        case .xiangZhiDaoMa: return "sun.min.fill"
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

//enum Colors:Int,CaseIterable{
//    case HaoXiangDarkGreen = 0, HaoXiangGreen, HaoXiangLightGreen, HaoXiangWhiteGreen, HaoXiangDarkGray, HaoXiangBrown, HaoXiangBlack, HaoXiangWhite
//    var color: Any{
//        switch self {
//        ///#66A374
//        case .HaoXiangDarkGreen:  return #colorLiteral(red: 0.3814475536, green: 0.6404736638, blue: 0.4620088935, alpha: 1)
//        ///#79BC89
//        case .HaoXiangGreen:      return #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
//        ///#7DD0A4
//        case .HaoXiangLightGreen: return #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
//        ///#96EABD
//        case .HaoXiangWhiteGreen: return #colorLiteral(red: 0.5876620412, green: 0.9183974862, blue: 0.7402922511, alpha: 1)
//        ///#5B5B5B
//        case .HaoXiangDarkGray:   return #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
//        ///#77625C
//        case .HaoXiangBrown:      return #colorLiteral(red: 0.468264699, green: 0.3851454258, blue: 0.3606632352, alpha: 1)
//        ///#000000
//        case .HaoXiangBlack:      return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        ///#FFFFFF
//        case .HaoXiangWhite:      return #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
//        }
//    }
//}


