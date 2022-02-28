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
        tableView.register(PageViewControllerCell.self, forCellReuseIdentifier:PageViewControllerCell.reuseIdentifier)
        tableView.allowsSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 60
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    private let signInButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"signInButton"), for: .normal)
        button.layer.shadowOffset = CGSize(width: button.bounds.width / 10, height: button.bounds.width / 10)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 3
        button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    let textField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "想知道..."
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
    
    let backGroundView:UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        addSubview(backGroundView)
        addSubview(signInButton)
        addSubview(textField)
        addSubview(sendButton)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.left.equalToSuperview()
            make.bottom.equalTo(backGroundView.snp.top)
        }
        
        backGroundView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.left.equalToSuperview()
            make.height.equalTo(80)
        }
        
        signInButton.snp.makeConstraints { make in
            make.left.equalTo(backGroundView.snp.left).offset(15)
            make.bottom.equalTo(backGroundView.snp.bottom).offset(-10)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(backGroundView).offset(15)
            make.left.equalTo(signInButton.snp.right).offset(5)
            make.top.equalTo(backGroundView.snp.top).offset(15)
        }
        
        sendButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(80)
            make.right.equalTo(-15)
            make.left.equalTo(textField.snp.right).offset(5)
            make.top.equalTo(backGroundView.snp.top).offset(15)
        }
    }

}
