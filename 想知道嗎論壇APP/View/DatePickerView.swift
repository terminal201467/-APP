//
//  DatePickerView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/14.
//

import UIKit

class DatePickerView: UIView {

    let datePicker:UIDatePicker = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let fromDate = formatter.date(from: "2017-12-31")
        let endDate = Date()
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = fromDate
        datePicker.maximumDate = endDate
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "zh_TW")
        return datePicker
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(datePicker)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func autoLayout(){
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.right.equalTo(15)
            make.left.equalTo(-15)
        }
    }

}
