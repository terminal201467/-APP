//
//  InsideTItleAndDatePicker.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/22.
//

import UIKit

class InsideTItleAndDatePicker: UIView {
    
    let datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        
        return datePicker
    }()
    
    var titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.tintColor = .white
        titleLabel.text = ""
        titleLabel.textAlignment = .right
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        let titleAndDatePickerStackView: UIStackView = {
            let titleAndDatePickerStackView = UIStackView(arrangedSubviews: [titleLabel,datePicker])
            titleAndDatePickerStackView.axis = .horizontal
            titleAndDatePickerStackView.distribution = .fillEqually
            titleAndDatePickerStackView.spacing = 10
            return titleAndDatePickerStackView
        }()
        addSubview(titleAndDatePickerStackView)
        titleAndDatePickerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
