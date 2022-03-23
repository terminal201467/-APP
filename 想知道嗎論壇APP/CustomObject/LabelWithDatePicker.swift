//
//  InsideTItleAndDatePicker.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/22.
//

import UIKit

class LabelWithDatePicker: UIView {
    
    let title:UILabel = {
       let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.tintColor = .white
        titleLabel.textAlignment = .right
        return titleLabel
    }()
    
    let datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()
    
    lazy var stackView: UIStackView = {
        let titleAndDatePickerStackView = UIStackView(arrangedSubviews: [title,datePicker])
        titleAndDatePickerStackView.axis = .horizontal
        titleAndDatePickerStackView.distribution = .fillProportionally
        titleAndDatePickerStackView.alignment = .center
        titleAndDatePickerStackView.spacing = 10
        return titleAndDatePickerStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        datePicker.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.55)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
