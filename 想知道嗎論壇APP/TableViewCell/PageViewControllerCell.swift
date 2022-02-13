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
        return button
    }()
    
    private let likeButton:UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: CellLogo.like.logo), for: .normal)
        return button
    }()
    
    private let count:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    private let date:UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private lazy var buttons:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [collectionButton,likeButton,count,date])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var cellStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title,buttons])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        contentView.addSubview(cellStackView)
        autoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        cellStackView.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.bottom.equalToSuperview()
        }
    }
    
    public func configuration(data:HomePageData){
        title.text = data.title
        count.text = String(data.count)
        date.text = data.date
    }
}
