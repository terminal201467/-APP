//
//  Model.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/1.
//

import Foundation

struct HomePageData{
    var title:String
    var count:Int
    var date:String
}


struct WannaKnowListData {
    var titleText:String
    var personName:String
    var date:String
    var content:String
    var buttonArray:[String]
    var likeCount:String
    var commentCount:String
    var chatMessage:[ChatMessage]?
    
    struct ChatMessage{
        var commentPerson:String
        var commentStair:Int
        var commentStairString:String{
            return String(commentStair)
        }
        var commentMessage:String
        var commentDate:String
        var likeCount:Int
        var likeCountString:String{
            String(likeCount)
        }
    }
}
