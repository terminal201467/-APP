//
//  CalendarDataBase.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/4.
//

import Foundation

class CalendarDataBase{

    //MARK:-ClosurePassData
    
    var valueChanged:(()->Void)?

    var onError:((Error)->Void)?
    
    //MARK:-Properties
    
    let eventTimeTranslate:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }()
    
    let dateTranslate:DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter
    }()
    
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
        filterEvents = yearsEvent.filter({(dateArray)->Bool in
            let date = dateArray
            let isMach = date.date.localizedCaseInsensitiveContains(chooseDate)
            return isMach
        })
    }
    
    //MARK:-the Method for calendar
    public func showAllEvent()->[Date]{
        for (index,value) in yearsEvent.enumerated(){
            if value.date == ""{
                yearsEvent.remove(at: index)
            }
        }
        let events = yearsEvent.map{eventTimeTranslate.date(from: $0.date)!}
        return events
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

extension Array where Element:Hashable{
    func removeDuplicates()->[Element]{
        var addedDict = [Element:Bool]()
        return filter{
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
}
