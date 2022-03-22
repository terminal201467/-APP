//
//  ImageAndTextField.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/22.
//

import UIKit

class ImageAndTextField: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Group 14")
        imageView.tintColor = .black
        
        return imageView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.clearButtonMode = .whileEditing
        textField.font = .systemFont(ofSize: 18)
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.text = ""
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.layer.borderColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        textField.layer.borderWidth = 2
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        let imageAndTextFieldStackView = UIStackView(arrangedSubviews: [imageView, textField])
        imageAndTextFieldStackView.axis = .horizontal
        imageAndTextFieldStackView.distribution = .fill
        imageAndTextFieldStackView.spacing = 10
        addSubview(imageAndTextFieldStackView)
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.leading.equalTo(132)
        }
        imageAndTextFieldStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
