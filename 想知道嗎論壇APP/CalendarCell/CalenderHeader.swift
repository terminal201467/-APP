//
//  CalenderHeader.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/1.
//

import UIKit
import JTAppleCalendar

class CalenderHeader: JTACMonthReusableView {
    
    static let reuseIdentifier:String = "Header"

    var monthTitle:UILabel = {
        let title = UILabel()
        title.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        title.font = UIFont.systemFont(ofSize: 20)
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(monthTitle)
        autoLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        monthTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
    }
    

}
