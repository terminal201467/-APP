//
//  CalenderCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/23.
//

import UIKit
import JTAppleCalendar

class CalenderCell: JTACMonthCell{
    
    static let reuseIdentifier = "cell"
    
    let dayLabel:UILabel = {
       let label = UILabel()
        
       return label
    }()
    
    let selectedView:UIView = {
       let view = UIView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
