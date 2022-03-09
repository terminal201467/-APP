//
//  CalendarDataBase.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/4.
//

import Foundation

class CalendarDataBase {
    
    //Need to do something,to let the calendar save the data to this CalendarDataBase
    //Need to allow the datePicker pass the date to this object
    //Need to 
    
    //MARK:-Intialization
    public init(parameter byYear:String){ self.year = byYear }
    
    //MARK:-ClosurePassData
    
    var valueChange:(()->Void)?

    var onError:((Error)->Void)?
    
    //MARK:-Properties
    
    private var year:String
    
    var detailData:[YearData] = []{
        didSet{
            valueChange?()
        }
    }
    
    //MARK:-Method
    public func loadData(){
        WannaKnowAPI.shared.getYearData(callBy: .year(year)) { result in
            switch result{
            case .success(let data):  self.detailData = data
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    public func numberOfRowsInSection(_ section:Int)->Int{
        return detailData.count
    }
    
    public func getData(_ indexPath:IndexPath)->YearData{
        return detailData[indexPath.row]
    }
}
