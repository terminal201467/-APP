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
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        return tableView
    }()
    
    let textFieldContainer:UIView = {
        let view = UIView()
        return view
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
        
        textFieldContainer.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.left.equalToSuperview()
            make.height.equalTo(70)
        }
        
    }

}
