//
//  CommentsDataBase.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/4.
//

import Foundation

class CommentsDataBase{
    
    //MARK:-ClosurePassData
    
    var valueChange:(()->Void)?

    var onError:((Error)->Void)?
    
    
    private var commentData:[CommentsData] = []
    
    
    
    
}
