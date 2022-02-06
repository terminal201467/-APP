//
//  WannaKnowCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/4.
//

import UIKit

class CententCell: UITableViewCell {
    
    static let reuseIdentifier = "CententCell"
    
    private let title:UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let personPhoto:UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private let personName:UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let contentLabel:UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    private let collectionButton:UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let likeButton:UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let commentButton:UIButton = {
        let button = UIButton()
        
        return button
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        
    }
    
}
