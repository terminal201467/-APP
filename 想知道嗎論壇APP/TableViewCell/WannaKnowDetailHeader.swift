//
//  WannaKnowHeader.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/10.
//

import UIKit

class WannaKnowDetailHeader: UITableViewHeaderFooterView {
    
    static let reuseIdentifier:String = "WannaKnowHeader"
    
    private let title:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 2
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private let personPhoto:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: CellLogo.personLogo.logo))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let personName:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let hostPosition:UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.bounds.size = CGSize(width: 100, height: 40)
        label.layer.backgroundColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.text = "  樓主  "
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
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 5
        return label
    }()
    
    private let collectionButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: CellLogo.collection.logo), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let linkButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: CellLogo.link.logo), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let linkLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "附件"
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
        return label
    }()
    
    private let commemtButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: CellLogo.message.logo), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
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
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        contentView.addSubview(idendityStackView)
        contentView.addSubview(title)
        contentView.addSubview(date)
        contentView.addSubview(contentLabel)
        contentView.addSubview(collectionButton)
        contentView.addSubview(buttonStackView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        idendityStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(70)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(idendityStackView)
            make.left.equalTo(idendityStackView.snp.right).offset(15)
            make.right.equalToSuperview().offset(-15)
            make.width.equalTo(80)
        }
        
        date.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalTo(idendityStackView.snp.bottom).offset(-5)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(idendityStackView.snp.bottom).offset(15)
            make.left.equalTo(idendityStackView.snp.left).offset(10)
            make.right.equalToSuperview().offset(-15)
        }
        
        collectionButton.snp.makeConstraints { make in
            make.left.equalTo(idendityStackView.snp.left).offset(5)
            make.bottom.equalToSuperview().offset(-15)
            make.height.equalTo(30)
            make.width.equalTo(25)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.right.equalTo(date.snp.right)
            make.bottom.equalTo(collectionButton.snp.bottom)
            make.height.equalTo(30)
            make.width.equalTo(210)
        }
    }
    
    public func configuration(data:WannaKnowListData){
        title.text = data.titleText
        personName.text = data.personName
        date.text = data.date
        contentLabel.text = data.content
        likeCount.text = data.likeCount
        commentCount.text = data.commentCount
    }
}
