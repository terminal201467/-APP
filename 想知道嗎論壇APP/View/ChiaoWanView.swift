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
    
    let applyButton:UIButton = {
       let button = UIButton()
//        button.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
        button.layer.cornerRadius = 20
        return button
    }()
    
    let textField:UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "想知道..."
        textField.keyboardAppearance = .light
        textField.layer.cornerRadius = 18
        textField.layer.borderWidth = 3
        textField.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return textField
    }()
    
    let sendButton:UIButton = {
       let sendButton = UIButton()
        sendButton.layer.cornerRadius = 18
        sendButton.layer.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        sendButton.setTitle("送出", for: .normal)
        return sendButton
    }()
    
    lazy var textFieldContainerStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textField,sendButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
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
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(35)
            make.bottom.equalTo(-40)
        }
    }
}
