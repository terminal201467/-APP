//
//  CalendarDataBase.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/4.
//

import Foundation

class CalendarDataBase {
    
    //1.先把所有的API資料都get進來
    //得到想知道演講資料的方式：1.點按日期 2.從DatePicker調日期
    
    //2.點按單一日期，就會從日期(filter)去要title
    //3.取消單一日期，tableView就會清空所有事件,remove全部日期
    
    //1.DatePicker去調日期，然後傳給日曆套件，然後tableView.reloadData()就會跑新的值出來
    //2.一DatePicker去調日期，然後傳給日曆套件，然後calendar會更動所有的資料
    
    //MARK:-ClosurePassData
    
    var valueChanged:(()->Void)?

    var onError:((Error)->Void)?
    
    //MARK:-Properties
    
    var chooseDate:String?
    
    private var yearsEvent:[YearData] = []{
        didSet{
            valueChanged?()
        }
    }
    
    private var filterEvents:[YearData] = []
    
    //MARK:-Method
    public func loadData(){
        WannaKnowAPI.shared.getBaseURL { result in
            switch result{
            case .success(let data): self.yearsEvent = data
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    public func filterDate(for chooseDate:String){
        filterEvents = yearsEvent.filter({ (dateArray)->Bool in
            let date = dateArray
            let isMach = date.date.localizedCaseInsensitiveContains(chooseDate)
            return isMach
        })
    }
    
    //MARK:-the Method for calendar
    public func showAllEvent()->[Date]{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return yearsEvent.map{formatter.date(from:$0.date)!}
    }
    
    //MARK:-the Method for table
    public func numberOfRowInSection(_ section:Int)->Int{
        return filterEvents.count
    }
    
    public func getData(at indexPath:IndexPath)->YearData{
        return filterEvents[indexPath.row]
    }
    
    public func removeAllData(){
        filterEvents.removeAll()
    }
}
