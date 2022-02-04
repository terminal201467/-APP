//
//  HomePageSideMenuCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/20.
//

import UIKit
import SnapKit

class SideMenuCell: UITableViewCell {
    
    static let reuseIdentifier = "HomePageSideMenuCell"
    
    let logoMark:UIImageView = {
        let logoMark = UIImageView()
        logoMark.contentMode = .scaleAspectFit
        return logoMark
    }()
    
    let controllerName:UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize:20)
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
        backgroundColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
        contentView.addSubview(stackView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        stackView.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(snp_topMargin)
            make.bottom.equalTo(snp_bottomMargin)
        }
    }
}
