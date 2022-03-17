//
//  CollectionViewCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/17.
//

import UIKit

class ThemeCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ButtonCell"
    
    var category:UILabel = {
       let label = UILabel()
        label.layer.cornerRadius = 15
        label.layer.borderColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        label.layer.borderWidth = 2
        label.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(category)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
       category.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
    }
}
