//
//  CalenderView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit
import JTAppleCalendar

class CalenderView: UIView {

    let calendar:JTACMonthView = {
        let calendarView = JTACMonthView()
        calendarView.register(CalenderCell.self, forCellWithReuseIdentifier: CalenderCell.reuseIdentifier)
        calendarView.register(CalenderHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CalenderHeader.reuseIdentifier)
        calendarView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        calendarView.allowsMultipleSelection = true
        calendarView.showsHorizontalScrollIndicator = false
        calendarView.rangeSelectionMode = .continuous
        calendarView.allowsRangedSelection = true
        calendarView.scrollDirection = .horizontal
        calendarView.scrollingMode = .stopAtEachCalendarFrame
        calendarView.allowsRangedSelection = true
        return calendarView
    }()
    
    let tableView:UITableView = {
       let tableView = UITableView()
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.reusebleIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 120
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return tableView
    }()
    
    private let signInButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "signInButton"), for: .normal)
        button.layer.shadowOffset = CGSize(width: button.bounds.width / 10, height: button.bounds.width / 10)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 3
        button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private let dateChooseButton:UIButton = {
       let button = UIButton()
        button.setTitle("選擇日期", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.backgroundColor = #colorLiteral(red: 0.5876620412, green: 0.9183974862, blue: 0.7402922511, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.titleEdgeInsets = .init(top: 0, left: 2, bottom: 0, right: 2)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(calendar)
        addSubview(tableView)
        addSubview(signInButton)
        addSubview(dateChooseButton)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        calendar.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(calendar.snp.bottom)
            make.right.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.bottom.equalTo(-10)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        dateChooseButton.snp.makeConstraints { make in
            make.top.equalTo(calendar.snp.top).offset(15)
            make.right.equalTo(calendar.snp.right).offset(-15)
            make.width.equalTo(80)
        }
    }
}
