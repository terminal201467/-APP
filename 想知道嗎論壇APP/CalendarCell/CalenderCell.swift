//
//  CalenderCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/23.
//

import UIKit
import JTAppleCalendar

class CalenderCell: JTACDayCell{
    
    static let reuseIdentifier = "cell"
    
    let dateLabel:UILabel = {
       let label = UILabel()
       return label
    }()
    
    let selectedView:UIView = {
       let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(dateLabel)
        contentView.addSubview(selectedView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func autoLayout(){
        dateLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        selectedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
