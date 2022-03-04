//
//  CommentsDataBase.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/4.
//

import Foundation

class CommentsDataBase{
    
    //MARK:-Intializer
    init(parameter byId:String){ self.id = byId }
    
    //MARK:-Properties
    private var id:String
    
    private var commentData:[CommentsData] = []{
        didSet{
            valueChange?()
        }
    }
    
    var valueChange:(()->Void)?

    var onError:((Error)->Void)?
    
    //MARK:-Methods
    public func loadData(){
        CommentsAPI.shared.getCommentsAPI(callBy: id) { result in
            switch result{
            case .success(let data):  self.commentData.append(data)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    public func numberOfRowsInSection(_ section:Int)->Int{
        return commentData.count
    }
    
    public func getData(_ indexPath:IndexPath)->CommentsData{
        return commentData[indexPath.row]
    }
}
