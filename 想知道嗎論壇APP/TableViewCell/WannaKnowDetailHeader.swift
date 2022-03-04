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
    
    private let speaker:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
        let stackView = UIStackView(arrangedSubviews: [personPhoto,speaker,hostPosition])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private let date:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private let descriptionLabel:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 5
        return label
    }()

    private let likeButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: CellLogo.like.logo), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let like:UILabel = {
       let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let commentButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: CellLogo.message.logo), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let commentAmount:UILabel = {
       let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20)
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
    
    private let linkLabel:UILabel = {
       let label = UILabel()
        label.text = "連結"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var buttonStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews:[likeButton,like,commentButton,commentAmount,collectionButton,linkButton,linkLabel])
        stackView.distribution = .fillProportionally
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
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(linkLabel)
        contentView.addSubview(linkButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(like)
        contentView.addSubview(commentButton)
        contentView.addSubview(commentAmount)
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
        
        like.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        commentButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        commentAmount.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        collectionButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        
        likeButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        linkButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(idendityStackView.snp.bottom).offset(15)
            make.left.equalTo(idendityStackView.snp.left).offset(10)
            make.right.equalToSuperview().offset(-15)
        }
        
        linkLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(50)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.right.equalTo(date.snp.right)
            make.bottom.equalToSuperview().offset(-15)
            make.height.equalTo(30)
            make.width.equalTo(265)
        }
    }
    
    public func configuration(data:WannaKnowData.Data){
        title.text = data.title
        speaker.text = data.speaker
        date.text = data.date
        descriptionLabel.text = data.description
        like.text = data.like
        commentAmount.text = data.comment_amount
    }
}
