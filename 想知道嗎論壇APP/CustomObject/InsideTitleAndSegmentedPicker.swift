//
//  InsideTitleAndSegmentedPicker.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/22.
//

import UIKit

class InsideTitleAndSegmentedPicker: UIView {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.tintColor = .white
        titleLabel.text = ""
        titleLabel.textAlignment = .right
        return titleLabel
    }()
    
    let segmentedPicker: UISegmentedControl = {
        let segmentedPicker = UISegmentedControl(items: ["現場","遠端"])
        segmentedPicker.selectedSegmentIndex = 0
        segmentedPicker.selectedSegmentTintColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        
        return segmentedPicker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        let labelAndSegmentedPickerStackView: UIStackView = {
            let labelAndSegmentedPickerStackView = UIStackView(arrangedSubviews: [titleLabel, segmentedPicker])
            labelAndSegmentedPickerStackView.axis = .horizontal
            labelAndSegmentedPickerStackView.distribution = .fillEqually
            labelAndSegmentedPickerStackView.spacing = 10
            return labelAndSegmentedPickerStackView
        }()
        addSubview(labelAndSegmentedPickerStackView)
        labelAndSegmentedPickerStackView.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
    }
    
    
    
}
