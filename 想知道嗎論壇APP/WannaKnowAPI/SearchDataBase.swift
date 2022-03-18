//
//  SearchDataBase.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/8.
//

import Foundation


class SearchDataBase{
    
    //MARK:-Intializer
    init(searchBy category:String){
        self.category = category
    }
    
    init(searchByTag tag:String){
        self.tag = tag
    }
    
    //MARK:-Closures
    
    var valueChanged:(()->Void)?
    
    var onError:((Error)->Void)?
    
    //MARK:-Properties
    
    var category:String = ""
    
    var tag:String = ""
    
    private var data:[WannaKnowData.Data] = []{
        didSet{
            valueChanged?()
        }
    }
    
    private var filterData:[WannaKnowData.Data] = []
    
    //MARK:-Methods
    public func loadAllData(){
        WannaKnowAPI.shared.getWannaKnowData(callBy: .per_page("10")) { result in
            switch result{
            case .success(let data):  self.data = data.data
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    public func loadThemeData(){
        WannaKnowAPI.shared.getWannaKnowData(callBy: .category(category)) { result in
            switch result{
            case .success(let data):  self.data = data.data
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    public func loadTagData(){
        WannaKnowAPI.shared.getWannaKnowData(callBy: .tags(tag)) { result in
            switch result{
            case .success(let data):  self.data = data.data
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    public func filterContent(for searchText:String){
        filterData = data.filter({ (filterArray)->Bool in
            let words = filterArray
            let isMach = words.title.localizedCaseInsensitiveContains(searchText)
            return isMach
        })
    }
    
    //MARK:-tableViewFilterData
    func numberOfRowInSection(at section:Int)->Int{
        return filterData.isEmpty ? data.count:filterData.count
    }
    
    func getData(at index:IndexPath)->WannaKnowData.Data{
        return filterData.isEmpty ? data[index.row]:filterData[index.row]
    }
}
