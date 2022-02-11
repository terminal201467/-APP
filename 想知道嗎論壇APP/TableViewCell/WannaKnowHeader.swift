//
//  WannaKnowHeader.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/10.
//

import UIKit

class WannaKnowHeader: UITableViewHeaderFooterView {
    
    static let reuseIdentifier:String = "WannaKnowHeader"
    
    private let title:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let personPhoto:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: CellLogo.personLogo.logo))
        return imageView
    }()
    
    private let personName:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let hostPosition:UILabel = {
        let label = UILabel()
        label.text = "樓主"
        return label
    }()
    
    //MARK:the stackView of the person identifier
    lazy var idendityStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [personPhoto,personName,hostPosition])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private let date:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let contentLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let collectionButton:UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        return button
    }()
    
    private let linkButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: CellLogo.link.logo), for: .normal)
        return button
    }()
    
    let linkLabel:UILabel = {
        let label = UILabel()
        label.text = "附件"
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
    
    private let commemtButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: CellLogo.message.logo), for: .normal)
        return button
    }()
    
    private let commentCount:UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var buttonStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews:[linkButton,linkLabel,likeButton,likeCount,commemtButton,commentCount])
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 3
        return stackView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        idendityStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
            
        }
        
        title.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
        }
        
        date.snp.makeConstraints { make in
            make.right.equalTo(title)
            make.bottom.equalTo(idendityStackView.snp.bottom).offset(15)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(idendityStackView).offset(10)
            make.left.equalTo(idendityStackView)
            make.right.equalTo(date.snp.right)
        }
        
        collectionButton.snp.makeConstraints { make in
            make.left.equalTo(idendityStackView)
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.right.equalTo(date.snp.right)
            make.bottom.equalTo(collectionButton.snp.bottom)
        }
    }
    
    private func configuration(data:WannaKnowListData){
        title.text = data.titleText
        personName.text = data.personName
        date.text = data.date
        contentLabel.text = data.content
        likeCount.text = data.likeCount
        commentCount.text = data.commentCount
    }
}
