//
//  Model.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import Foundation

enum SideMenuName:Int,CaseIterable{
    case xiangZhiDaoMa = 1
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
    case like = 0,collection,message,personLogo,link
    var logo:String{
        switch self {
        case .like:          return "hand.thumbsup"
        case .collection:    return "collection"
        case .message:       return "message"
        case .personLogo:    return "person"
        case .link:          return "link"
        }
    }
    
}

enum ArticlePages:Int,CaseIterable{
    case news = 0,hot,follow
    var text:String{
        switch self {
        case .news:   return "最新"
        case .hot:    return "熱門"
        case .follow: return "追蹤"
        }
    }
}

enum ArticleKind:Int,CaseIterable{
    case projectExperiance = 0,learnMemo,skillResearch,workLife,lifeChannel
    var text:String{
        switch self {
        case .projectExperiance: return "專案經驗"
        case .learnMemo:         return "學習小心得"
        case .skillResearch:     return "技術剖析"
        case .workLife:          return "職場工作"
        case .lifeChannel:       return "生活頻道"
        }
    }
}


enum InternetError:Error{
    case invalidURL
    case requestFailed
    case invalidData
    case invalidResponse
}

enum CallMethod{
    case page(Int)
    case hot(Bool)
    case category(String)
    case tag(String)
    case year(Int)
    var parameter:[String:Any]{
        switch self {
        case .page(let page):
            return ["page":page]
        case .hot(let hot):
            return ["hot":hot]
        case .category(let category):
            return ["category":category]
        case .tag(let tag):
            return ["tag":tag]
        case .year(let year):
            return ["year":year]
        }
    }
}

enum ItemRanges:Int,CaseIterable{
    case untilfirst = 0,untilSecond,untilThird
    var range:ClosedRange<Int>{
        switch self{
        case .untilfirst: return 0...1
        case .untilSecond: return 0...2
        case .untilThird: return 0...3
        }
    }
}
