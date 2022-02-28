////
////  EditingTextFieldView.swift
////  想知道嗎論壇APP
////
////  Created by Jhen Mu on 2022/2/3.
////
//
//import UIKit
//
//class EditingTextFieldView: UIView {
//
//
//
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addSubview(signInButton)
//        addSubview(textField)
//        addSubview(sendButton)
//        autoLayout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func autoLayout(){
//        signInButton.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(8)
//            make.left.equalToSuperview().offset(8)
//            make.width.equalTo(signInButton.snp.height)
//            make.bottom.equalToSuperview().offset(-8)
//        }
//        textField.snp.makeConstraints { make in
//            make.centerY.equalTo(signInButton.snp.centerY)
//            make.height.equalToSuperview().multipliedBy(0.6)
//            make.width.equalToSuperview().multipliedBy(0.55)
//            make.left.equalTo(signInButton.snp_rightMargin).offset(10)
//        }
//        sendButton.snp.makeConstraints { make in
//            make.centerY.equalTo(textField.snp.centerY)
//            make.height.equalTo(textField.snp.height)
//            make.left.equalTo(textField.snp_rightMargin).offset(15)
//            make.right.equalToSuperview().offset(-10)
//        }
//    }
//
//}
