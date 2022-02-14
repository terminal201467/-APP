//
//  PageViewControllerCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/1.
//

import UIKit

class PageViewControllerCell: UITableViewCell {
    
    static let reuseIdentifier:String = "PagesCell"
    
    private let title:UILabel = {
       let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let collectionButton:UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: CellLogo.collection.logo), for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.contentMode = .scaleAspectFit
        return button
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
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    private let date:UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        addSubview(title)
        addSubview(date)
        addSubview(collectionButton)
        addSubview(likeButton)
        addSubview(likeCount)
        autoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        title.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.45)
        }
        
        collectionButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(23)
            make.centerY.equalToSuperview()
            make.left.equalTo(title.snp.right)
        }
        
        likeButton.snp.makeConstraints { make in
            make.height.equalTo(collectionButton.snp.height)
            make.width.equalTo(collectionButton.snp.width)
            make.centerY.equalToSuperview()
            make.left.equalTo(collectionButton.snp.right).offset(10)
        }
        
        likeCount.snp.makeConstraints { make in
            make.left.equalTo(likeButton.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
        
        date.snp.makeConstraints { make in
            make.left.equalTo(likeCount.snp.right).offset(10)
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
        }
    }
    
    public func configuration(data:HomePageData){
        title.text = data.title
        likeCount.text = String(data.count)
        date.text = data.date
    }
}
