//
//  FloatingButton.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/24.
//

import UIKit

class FloatingButton: UIView {

    let signInButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "signInButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(signInButton)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func autoLayout(){
        signInButton.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.bottom.equalTo(-15)
        }
        
    }
}
