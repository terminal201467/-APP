//
//  InsideTitleAndDorpDownList.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/22.
//

import UIKit
import DropDown

class LabelWithDropDown: UIView {

    let title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.tintColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let kindPicker:UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        button.setTitle("請選擇分類", for: .normal)
        return button
    }()
    
    let dropDownList: DropDown = {
        let dropDownList = DropDown()
        dropDownList.direction = .bottom
        dropDownList.dismissMode = .onTap
        dropDownList.textColor = .black
        dropDownList.textFont = .systemFont(ofSize: 18)
        dropDownList.backgroundColor = .white
        dropDownList.selectedTextColor = .white
        dropDownList.selectionBackgroundColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        dropDownList.cornerRadius = 10
        return dropDownList
    }()
    
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title, kindPicker])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(kindPicker)
        addSubview(stackView)
//        setDropDownButton()
        autoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func setDropDownButton(){
//        dropDownList.anchorView = kindPicker
//    }

    private func autoLayout() {
        kindPicker.snp.makeConstraints{ make in
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.55)
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
