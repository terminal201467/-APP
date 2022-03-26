//
//  WannaKnowListView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit

class WannaKnowResultView: UIView {
    
    let signInButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"signInButton"), for: .normal)
        button.layer.shadowOffset = CGSize(width: button.bounds.width / 10, height: button.bounds.width / 10)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 3
        button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.reuseIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tableView.estimatedRowHeight = 300
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addSubview(tableView)
        addSubview(signInButton)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        signInButton.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.bottom.equalTo(-10)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        tableView.snp.makeConstraints { make in
            make.right.left.top.bottom.equalToSuperview()
        }
    }
}
