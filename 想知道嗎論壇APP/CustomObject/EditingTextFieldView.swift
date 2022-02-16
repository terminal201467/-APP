//
//  EditingTextFieldView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/3.
//

import UIKit

class EditingTextFieldView: UIView {

    private let signInButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"signInButton"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.468264699, green: 0.3851454258, blue: 0.3606632352, alpha: 1)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    let textField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "想知道..."
        textField.position(from: textField.beginningOfDocument, offset: 5)
        textField.tintColor = .gray
        textField.keyboardAppearance = .light
        textField.layer.cornerRadius = 22
        textField.layer.borderWidth = 2
        textField.layer.borderColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        return textField
    }()
    
    private let sendButton:UIButton = {
       let sendButton = UIButton()
        sendButton.layer.cornerRadius = 22
        sendButton.layer.backgroundColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        sendButton.setTitle("送出", for: .normal)
        return sendButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(signInButton)
        addSubview(textField)
        addSubview(sendButton)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        signInButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.width.equalTo(signInButton.snp.height)
            make.bottom.equalToSuperview().offset(-8)
        }
        textField.snp.makeConstraints { make in
            make.centerY.equalTo(signInButton.snp.centerY)
            make.height.equalToSuperview().multipliedBy(0.6)
            make.width.equalToSuperview().multipliedBy(0.55)
            make.left.equalTo(signInButton.snp_rightMargin).offset(10)
        }
        sendButton.snp.makeConstraints { make in
            make.centerY.equalTo(textField.snp.centerY)
            make.height.equalTo(textField.snp.height)
            make.left.equalTo(textField.snp_rightMargin).offset(15)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
}
