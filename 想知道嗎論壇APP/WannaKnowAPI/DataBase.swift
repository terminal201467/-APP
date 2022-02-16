//
//  DataBase.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/16.
//

import Foundation


class DataBase{
    
    var data:[WannaKnowData] = []
    
    func getData(callby method:CallMethod){
        WannaKnowAPI.shared.getCurrentData(callBy: method) { result in
            
            
        }
        
    }
    
    
}
