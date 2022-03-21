//
//  ResultTableView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/21.
//

import UIKit

class ResultTableView: UIView {
    
    let resultHeader:SearchResultHeader = {
       let header = SearchResultHeader()
        return header
    }()
    
    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.reuseIdentifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(resultHeader)
        addSubview(tableView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        resultHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.right.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(resultHeader.snp.bottom)
            make.right.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
