//
//  SearchResultHeader.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/5.
//

import UIKit

class SearchResultHeader: UITableViewHeaderFooterView {

    static let header:String = "SearchResultHeader"
    
    let magnifier:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "greenMagnifier")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let tagLabel:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
        return label
    }()
    
    let relateText:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let totalText:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private lazy var topText:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tagLabel,relateText])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var textArea:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topText,totalText])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 3
        return stackView
    }()
    
    lazy var searchInfo:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topText,textArea])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 3
        return stackView
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(magnifier)
        addSubview(searchInfo)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        magnifier.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        searchInfo.snp.makeConstraints { make in
            make.top.equalTo(magnifier.snp.top)
            make.left.equalTo(magnifier.snp.right).offset(5)
        }
    }
    
    private func configuration(result data:[WannaKnowData.Data]){
        tagLabel.text = "\(data.map{$0})"
        relateText.text = "相關文章"
        totalText.text = "共有\(data.count)篇文章"
    }
    
}
