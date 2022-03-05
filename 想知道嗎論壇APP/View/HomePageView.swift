//
//  HomePageView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit

class HomePageView: UIView {
    
    //MARK:-Properties
    
    let searchBarContainer:UIView = {
       let view = UIView()
        view.isHidden = true
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return view
    }()
    
    let banner:UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "banner")
        imageView.backgroundColor = #colorLiteral(red: 0.468264699, green: 0.3851454258, blue: 0.3606632352, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let menuPageContainer:UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(banner)
        addSubview(searchBarContainer)
        addSubview(menuPageContainer)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        searchBarContainer.snp.makeConstraints { make in
            make.top.equalTo(layoutMarginsGuide)
            make.right.left.equalToSuperview()
            make.height.equalTo(50)
        }
        
        banner.snp.makeConstraints { make in
            make.top.equalTo(layoutMarginsGuide)
            make.right.left.equalToSuperview()
            make.height.equalTo(160)
        }
        
        menuPageContainer.snp.makeConstraints { make in
            make.top.equalTo(banner.snp_bottomMargin)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
