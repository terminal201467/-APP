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
    
    let editingTextFieldContainerView:UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        addSubview(editingTextFieldContainerView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.left.equalToSuperview()
            make.bottom.equalTo(editingTextFieldContainerView.snp_topMargin)
        }
        
        editingTextFieldContainerView.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp_topMargin)
            make.right.left.equalToSuperview()
            make.height.equalTo(70)
            make.bottom.equalToSuperview()
        }
    }
}
