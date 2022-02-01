//
//  HomePageSideMenuCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/20.
//

import UIKit
import SnapKit

class HomePageSideMenuCell: UITableViewCell {
    
    static let reuseIdentifier = "HomePageSideMenuCell"
    
    let logoMark:UIImageView = {
        let logoMark = UIImageView()
        return logoMark
    }()
    
    let controllerName:UILabel = {
       let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private lazy var stackView:UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [logoMark,controllerName])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        stackView.snp.makeConstraints { make in
            make.left.equalTo(70)
            make.right.equalTo(-70)
            make.top.equalTo(snp_topMargin)
            make.bottom.equalTo(snp_bottomMargin)
        }
    }
}
