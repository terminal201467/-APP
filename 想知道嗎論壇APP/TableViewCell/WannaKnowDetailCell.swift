//
//  WannaKnowDetailCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/4.
//

import UIKit

class WannaKnowDetailCell:UITableViewCell {
    
    static let reuseIdentifier = "DetailCell"
    
    private let personPhoto:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let personName:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let stairLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let contentLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let dateLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let likeButton:UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: CellLogo.like.logo), for: .normal)
        return button
    }()
    
    private let likeCount:UILabel = {
        let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configuration(data:WannaKnowListData){
        personName.text = data.chatMessage?.commentPerson
        contentLabel.text = data.chatMessage?.commentMessage
        dateLabel.text = data.chatMessage?.commentDate
//        likeCount.text = data.chatMessage?.likeCount
        
    }
    
}
