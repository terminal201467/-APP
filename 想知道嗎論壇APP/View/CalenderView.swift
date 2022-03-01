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
        calendarView.register(CalenderCell.self, forCellWithReuseIdentifier: CalenderCell.reuseIdentifier)
        calendarView.register(CalenderHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CalenderHeader.reuseIdentifier)
        calendarView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        calendarView.allowsMultipleSelection = true
        calendarView.showsHorizontalScrollIndicator = false
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(calendarView)
        addSubview(tableView)
        addSubview(signInButton)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        calendarView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(calendarView.snp.bottom)
            make.right.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.bottom.equalTo(-10)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
    }
}
