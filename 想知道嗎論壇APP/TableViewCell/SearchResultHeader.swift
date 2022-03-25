//
//  SearchResultHeader.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/5.
//

import UIKit

class SearchResultHeader: UIView{

    private let magnifier:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "greenMagnifier")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let tagLabel:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let relateText:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let totalText:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
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
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 3
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(magnifier)
        addSubview(searchInfo)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        magnifier.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.centerX.equalToSuperview().offset(-90)
            make.height.equalTo(50)
        }
        
        searchInfo.snp.makeConstraints { make in
            make.top.equalTo(magnifier.snp.top)
            make.left.equalTo(magnifier.snp.right).offset(5)
        }
    }
    
    func searchAllConfigure(result data:WannaKnowData){
        tagLabel.text = "想知道嗎？"
        relateText.text = "全部文章"
        totalText.text = "共有\(data.total_item)篇文章"
    }
    
    func searchKeywordConfigure(result data:WannaKnowData,keyword parameter:String){
        tagLabel.text = parameter
        relateText.text = "相關文章"
        totalText.text = "共有\(data.total_item)篇文章"
    }
}
