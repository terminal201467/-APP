//
//  WannaKnowDetailView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/10.
//

import UIKit

class WannaKnowDetailView: UIView {
    
    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(WannaKnowDetailCell.self, forCellReuseIdentifier: WannaKnowDetailCell.reuseIdentifier)
        tableView.register(WannaKnowDetailHeader.self, forHeaderFooterViewReuseIdentifier: WannaKnowDetailHeader.reuseIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.sectionHeaderHeight = 300
        tableView.rowHeight = 135
        tableView.allowsSelection = false
        return tableView
    }()
    
    let textField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "輸入文字..."
        textField.position(from: textField.beginningOfDocument, offset: 5)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.tintColor = .gray
        textField.keyboardAppearance = .light
        textField.layer.cornerRadius = 22
        textField.layer.borderWidth = 2
        textField.layer.borderColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        return textField
    }()
    
    private let sendButton:UIButton = {
       let sendButton = UIButton()
        sendButton.layer.cornerRadius = 22
        sendButton.layer.backgroundColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        sendButton.setTitle("送出", for: .normal)
        return sendButton
    }()
    
    lazy var textFieldContainer:UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [textField,sendButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 3
        stackView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        addSubview(textFieldContainer)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.left.equalToSuperview()
            make.bottom.equalTo(textFieldContainer.snp.top)
        }
        
        textField.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.65)
        }
        
        sendButton.snp.makeConstraints { make in
            make.right.equalTo(-15)
            make.left.equalTo(textField.snp.right).offset(10)
            make.height.equalTo(textField.snp.height)
        }
        
        textFieldContainer.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(70)
        }
    }
}
