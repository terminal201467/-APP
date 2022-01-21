//
//  WannaKnowView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit

class WannaKnowView: UIView {
    
    let segmentedControl:UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items:["文章","日曆"])
        segmentedControl.tintColor = .blue
        segmentedControl.backgroundColor = .gray
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    let collectionButtonContainer:UIView = {
       let view = UIView()
        view.backgroundColor = .blue
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
            make.top.equalTo(layoutMarginsGuide)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        collectionButtonContainer.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp_bottomMargin)
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
