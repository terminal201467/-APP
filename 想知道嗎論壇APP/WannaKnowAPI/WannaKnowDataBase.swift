//
//  DataBase.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/16.
//

import Foundation


class WannaKnowDataBase{
    
    //MARK:-Closer
    var onError:((Error)->Void)?
    
    var valueChanged:(()->Void)?
    
    private var data:[WannaKnowData.Data] = []{
        didSet{
            valueChanged?()
        }
    }
    
    private var filterData:[WannaKnowData.Data] = []{
        didSet{
            valueChanged?()
        }
    }
    
    //MARK:Method
    public func loadAllData(){
        WannaKnowAPI.shared.getWannaKnowData(callBy: .per_page("10")) { result in
            switch result{
            case .success(let data):
                self.data = data.data
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    ///其實這裡應該會有三種，但是，我覺得應該會是這邊只需要一個function，然後改動排序參數
    public func loadCategoryData(by category:String,order orderBy:String){
        WannaKnowAPI.shared.getWannaKnowData(callBy: .category(category),.orderby(orderBy)) { result in
            switch result{
            case .success(let data):
                self.data = data.data
                print("categoryData:",data)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    public func loadTagData(by tags:String){
        WannaKnowAPI.shared.getWannaKnowData(callBy: .tags(tags)) { result in
            switch result{
            case .success(let data):
                self.data = data.data
            case .failure(let error):print(error.localizedDescription)
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

    //MARK:-TableViewMethods
    
    public func numberOfRowsInSection(_ section:Int)->Int{
        return filterData.isEmpty ? data.count:filterData.count
    }
    
    public func getData(at indexPath:IndexPath)->WannaKnowData.Data{
        return filterData.isEmpty ? data[indexPath.row]:filterData[indexPath.row]
    }
    
    public func removeAll(){
        data.removeAll()
        filterData.removeAll()
    }
    
    //MARK:-CollectionViewTag
    public func numberOfRowsInCollectionViewSection(_ section:Int)->Int{
        return filterData.isEmpty ? data[section].tags.count :filterData[section].tags.count
    }
    
    public func getCollectionTagData(at indexPath:IndexPath)->String{
        return filterData.isEmpty ? data[indexPath.section].tags[indexPath.row]! :filterData[indexPath.section].tags[indexPath.row]!
    }
}
