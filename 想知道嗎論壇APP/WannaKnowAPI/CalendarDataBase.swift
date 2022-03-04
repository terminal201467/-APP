//
//  CalendarDataBase.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/4.
//

import Foundation

class CalendarDataBase {
    
    //MARK:-ClosurePassData
    
    var valueChange:(()->Void)?

    var onError:((Error)->Void)?
    
    private var detailData:[YearData] = []
    
    //MARK:-Method
    
//    public func getCalendarDataByYear(by year:String){
//        WannaKnowAPI.shared.getCalendarData(callBy: .year(year)) { result in
//            switch result{
//            case .success(let data):  self.detailData = data
//            case .failure(let error): print(error.localizedDescription)
//            }
//        }
//    }
}
