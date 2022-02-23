//
//  CollectionViewCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/17.
//

import UIKit

class ThemeCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ButtonCell"
    
    let button:UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.layer.borderColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        button.layer.borderWidth = 2
        button.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
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
            make.top.bottom.right.left.equalToSuperview()
        }
    }
}
