//
//  HomePageView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit

class HomePageView: UIView {
    
    //MARK:-Properties
    
    let searchBar:UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let banner:UIView = {
       let imageView = UIView()
        imageView.backgroundColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let menuPageContainer:UIView = {
       let view = UIView()
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(searchBar)
        addSubview(banner)
        addSubview(menuPageContainer)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(layoutMarginsGuide)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        banner.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp_bottomMargin)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(100)
        }
        
        menuPageContainer.snp.makeConstraints { make in
            make.top.equalTo(banner.snp_bottomMargin)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
