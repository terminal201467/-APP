//
//  WannaKnowView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit

class WannaKnowView: UIView {
    
    let searchBar:UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return searchBar
    }()
    
    let segmentedControl:UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items:SegmentedTitle.allCases.map{$0.title})
        segmentedControl.tintColor = .blue
        segmentedControl.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16)], for: .normal)
        segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let collectionButtonContainer:UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let menuContainer:UIView = {
       let view = UIView()
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(segmentedControl)
        addSubview(collectionButtonContainer)
        addSubview(menuContainer)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.right.equalTo(-15)
            make.left.equalTo(15)
        }
        
        collectionButtonContainer.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp_bottom).offset(15)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(60)
        }
        
        menuContainer.snp.makeConstraints { make in
            make.top.equalTo(collectionButtonContainer.snp_bottomMargin)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
