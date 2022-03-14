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
    
    let eventPoint:UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(selectedView)
        contentView.addSubview(eventPoint)
        contentView.addSubview(dateLabel)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func autoLayout(){
        dateLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        selectedView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(30)
        }
        eventPoint.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(-5)
        }
    }
    
}
