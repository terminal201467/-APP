//
//  WannaKnowListView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit

class WannaKnowListView: UIView {
    
    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.reuseIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        tableView.estimatedRowHeight = 300
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        tableView.snp.makeConstraints { make in
            make.right.left.top.bottom.equalToSuperview()
        }
    }
}
