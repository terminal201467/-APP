//
//  WannaKnowCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/4.
//

import UIKit

class ContentCell: UITableViewCell {
    
    static let reuseIdentifier = "CententCell"
    
    private let title:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private let personPhoto:UIImageView = {
        let imageView = UIImageView(image: UIImage(named:"person"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let personName:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let dateLabel:UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let contentLabel:UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 3
        return label
    }()
    
    private let likeButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: CellLogo.like.logo), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let likeCount:UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let commentButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: CellLogo.message.logo), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let commentCount:UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let collectionButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: CellLogo.collection.logo), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    
    lazy var buttonStackView:UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [likeButton,likeCount,commentButton,commentCount,collectionButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(title)
        addSubview(personPhoto)
        addSubview(personName)
        addSubview(dateLabel)
        addSubview(contentLabel)
        addSubview(buttonStackView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        title.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }
        
        personPhoto.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.left.equalToSuperview()
            make.height.equalTo(25)
        }
        
        personName.snp.makeConstraints { make in
            make.top.equalTo(personPhoto.snp.top)
            make.left.equalTo(personPhoto.snp.right)
            make.height.equalTo(personPhoto.snp.height)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(personPhoto.snp.top)
            make.bottom.equalTo(personPhoto.snp.bottom)
            make.right.equalToSuperview().offset(-15)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(personPhoto.snp.bottom).offset(10)
            make.left.equalTo(title.snp.left)
            make.right.equalToSuperview().offset(-10)
            
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.left.equalTo(title.snp.left)
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(30)
            make.width.equalTo(170)
        }
    }
    
    public func configuration(data:WannaKnowListData){
        title.text = data.titleText
        personName.text = data.personName
        dateLabel.text = data.date
        contentLabel.text = data.content
        likeCount.text = data.likeCount
        commentCount.text = data.commentCount
    }
}
