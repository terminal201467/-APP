//
//  CalenderView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit
import JTAppleCalendar

class CalenderView: UIView {

    let calendarView:JTACMonthView = {
        let calendarView = JTACMonthView()
//        calendarView.register(, forCellWithReuseIdentifier: <#T##String#>)
        calendarView.allowsMultipleSelection = true
        calendarView.allowsRangedSelection = true
        return calendarView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(calendarView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func autoLayout(){
        calendarView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
        
    }
    
}
