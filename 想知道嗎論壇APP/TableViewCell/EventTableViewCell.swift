//
//  EventTableViewCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/1.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    static let reusebleIdentifier = "EventCell"
    
    let dateInfo:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let speakerName:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let speechTitle:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    
    lazy var eventsInfo:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [speechTitle,speakerName])
        stackView.layer.cornerRadius = 8
        stackView.layer.backgroundColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 3
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dateInfo)
        contentView.addSubview(eventsInfo)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        dateInfo.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.top.equalTo(15)
        }
        
        eventsInfo.snp.makeConstraints { make in
            make.top.equalTo(dateInfo.snp.bottom)
            make.left.equalTo(10)
            make.right.bottom.equalTo(-10)
        }
        
        speechTitle.snp.makeConstraints { make in
            make.left.equalTo(15)
        }
        
        speakerName.snp.makeConstraints { make in
            make.left.equalTo(15)
            
        }
    }
    
    public func configuration(calenderData:CalenderData){
        dateInfo.text = calenderData.dateInfo
        speakerName.text = calenderData.speakerName
        speechTitle.text = calenderData.speechTitle
    }
}
