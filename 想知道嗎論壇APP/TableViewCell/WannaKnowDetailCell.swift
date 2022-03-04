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
        let imageView = UIImageView(image: UIImage(named: CellLogo.personLogo.logo))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let personName:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private let stairLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.layer.cornerRadius = 10
        label.bounds.size = CGSize(width: 20, height: 15)
        label.layer.backgroundColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        return label
    }()
    
    lazy var personInfoStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [personPhoto,personName,stairLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private let contentLabel:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 5
        return label
    }()
    
    private let dateLabel:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private let likeButton:UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: CellLogo.like.logo), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private let likeCount:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        contentView.addSubview(personInfoStackView)
        contentView.addSubview(contentLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(likeButton)
        contentView.addSubview(likeCount)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        personInfoStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(60)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(personInfoStackView.snp.top)
            make.left.equalTo(personInfoStackView.snp.right).offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(contentLabel.snp.left)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        likeButton.snp.makeConstraints { make in
            make.bottom.equalTo(dateLabel.snp.bottom)
            make.right.equalTo(likeCount.snp.left).offset(-10)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        likeCount.snp.makeConstraints { make in
            make.bottom.equalTo(dateLabel.snp.bottom)
            make.right.equalToSuperview().offset(-15)
        }
    }
    
    public func configuration(data:CommentsData){
        personName.text = data.wanna_know_id
        contentLabel.text = data.content
        dateLabel.text = data.content_time
        likeCount.text = data.like
        stairLabel.text = "一樓"
    }
}
