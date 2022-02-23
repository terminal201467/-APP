//
//  tagCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/18.
//

import UIKit

class TagCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ButtonCell"
    
    let button:UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.layer.backgroundColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.titleEdgeInsets = .init(top: 0, left: 5, bottom: 0, right: 5)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(button)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        button.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-15)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.width.greaterThanOrEqualTo(40)
        }
    }
}
