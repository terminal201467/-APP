//
//  NavigationTitleView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/1.
//

import UIKit

class NavigationTitleView: UIView {

    private let logo:UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named:"HaoXiangLogo")
        imageView.contentMode = .scaleAspectFit
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        return imageView
    }()
    
    private let textLogo:UIImageView = {
       let imageView = UIImageView()
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named:"HaoXiangTextLogo")
        return imageView
    }()
    
    lazy var navigationTitle:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logo,textLogo])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(navigationTitle)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        navigationTitle.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
            make.right.equalTo(-120)
            make.left.equalTo(60)
        }
    }
}
