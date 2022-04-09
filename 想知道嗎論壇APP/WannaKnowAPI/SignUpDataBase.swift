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
    var tagStore:[String] = []{
        didSet{
            valueChanged?()
        }
    }
    
    //MARK:-Post Method
    func post(){
        
    }
    
    //MARK:-CollectionView Delegate function
    func numberOfRowInSection(_ section:Int)->Int{
        return tagStore.count
    }
    
    func cellForItemAt(index:IndexPath)->String{
        return tagStore[index.row]
    }
    
    //MARK:-AppendData
    func appendToWannaKnowData(_ data:WannaKnowData){
        wannaKnowData.append(data)
    }
    
    func appendToStore(text:String){
        tagStore.append(text)
    }
    
    //MARK:-RemoveData
    func removeAll(){
        tagStore.removeAll()
    }
    
    func removeAt(_ indexPath:IndexPath)->String{
        return tagStore.remove(at: indexPath.row)
    }
    
}
