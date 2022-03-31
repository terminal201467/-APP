//
//  SignUpDataBase.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/30.
//

import Foundation


class SignUpDataBase{
    
    //MARK:-closures
    var valueChanged:(()->Void)?
    
    var onError:((Error)->())?
    
    
    private var wannaKnowData:[WannaKnowData] = []{
        didSet{
            valueChanged?()
        }
    }
    
    //MARK:-tagsStore
    private var store:[String] = []{
        didSet{
            valueChanged?()
        }
    }
    
    //MARK:-Post Method
    func post(){
        
    }
    
    //MARK:-CollectionView Delegate function
    func numberOfRowInSection(_ section:Int)->Int{
        return store.count
    }
    
    func cellForItemAt(index:IndexPath)->String{
        return store[index.row] + "x"
    }
    
    //MARK:-Append
    func appendToWannaKnowData(_ data:WannaKnowData){
        wannaKnowData.append(data)
    }
    
    func appendToStore(text:String){
        store.append(text)
    }
    
    //MARK:-RemoveData
    func removeAll(){
        store.removeAll()
    }
    
    func removeAt(_ indexPath:IndexPath)->String{
        return store.remove(at: indexPath.row)
    }
    
}
