//
//  DataBase.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/16.
//

import Foundation


class WannaKnowDataBase{
    
    var onError:((Error)->Void)?
    
    var valueChanged:(()->Void)?
    
    private var wannaKnowData:[WannaKnowData] = []{
        didSet{
            valueChanged?()
        }
    }
    
    public func loadDataByUpdateTime(){
        WannaKnowAPI.shared.getCurrentData(callBy: .orderby("update_time")) { result in
            switch result{
            case .success(let data):  self.wannaKnowData.append(data)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    //MARK:-TableView
    public var numberOfSection:Int{
        return wannaKnowData.count
    }
    
    public func numberOfRowsInSection(_ section:Int)->Int{
        return wannaKnowData.count
    }
    
    public func getData(at indexPath:IndexPath)->WannaKnowData.Data{
        return wannaKnowData[indexPath.section].data[indexPath.row]
    }
    
    //MARK:-CollectionViewTag
    public func numberOfRowsInCollectionViewSection(_ section:Int)->Int{
        return wannaKnowData.map{$0.data.map{$0.tags}}.count
    }
    
    public func getCollectionTagData(at indexPath:IndexPath)->Array<String?>{
        return wannaKnowData[indexPath.section].data[indexPath.row].tags
    }
    
}
