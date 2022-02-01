//
//  ChiaoWanView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/21.
//

import UIKit

class ChiaoWanView: UIView {

    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.allowsSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    private let signInButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"signInButton"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.468264699, green: 0.3851454258, blue: 0.3606632352, alpha: 1)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    let textField:UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "想知道..."
        textField.tintColor = .gray
        textField.keyboardAppearance = .light
        textField.layer.cornerRadius = 18
        textField.layer.borderWidth = 3
        textField.layer.borderColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        return textField
    }()
    
    private let sendButton:UIButton = {
       let sendButton = UIButton()
        sendButton.layer.cornerRadius = 18
        sendButton.layer.backgroundColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        sendButton.setTitle("送出", for: .normal)
        return sendButton
    }()
    
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signInButton,textField])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    lazy var textFieldContainerStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stackView,sendButton])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        addSubview(textFieldContainerStackView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        tableView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(480)
        }
        
        textFieldContainerStackView.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp_bottomMargin)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(35)
            make.bottom.equalTo(-40)
        }
    }
}
