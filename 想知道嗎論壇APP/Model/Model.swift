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

struct CalenderData {
    var recentDate:String
    var weekDate:String
    var dateLabel:String
    var speakerName:String
    var speechTitle:String
    var dateInfo:String{
        let info = [recentDate,"・",weekDate,",",dateLabel]
        return info.joined()
    }
}

struct WannaKnowData:Decodable{
    var current_page:String
    var total_page:String
    var per_page:String
    var total_item:String
    var data:[Data]
    
    struct Data:Decodable{
        var wanna_know_id:String
        var category:String
        var title: String
        var description:String
        var speaker: String
        var date: String
        var year: String
        var live: String
        var tags: [String?]
        var like: String
        var attachment: String
        var update_time: String
        var comment_amount: String
    }
}

struct YearData:Decodable{
    var wanna_know_id:String
    var category:String
    var title: String
    var description:String
    var speaker: String
    var date: String
    var year: String
    var live: String
    var tags: [String?]
    var like: String
    var attachment: String
    var update_time: String
    var comment_amount: String
}

struct CommentsData:Decodable{
    var wanna_know_id:String
    var messenger:String
    var comment_id:String
    var content:String
    var like:String
    var content_time:String
}
