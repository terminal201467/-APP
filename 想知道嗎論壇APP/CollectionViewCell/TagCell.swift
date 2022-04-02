//
//  tagCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/18.
//

import UIKit
import SwiftUI

class TagCell:UICollectionViewCell{
    
    static let reuseIdentifier = "tag"

    let tagLabel:CustomTag = {
        let label = CustomTag()
        label.layer.cornerRadius = 12
        label.layer.backgroundColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tagLabel)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        tagLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
