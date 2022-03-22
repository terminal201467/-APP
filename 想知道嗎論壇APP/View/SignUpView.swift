//
//  SignUpView.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import Foundation
import SnapKit
import UIKit

class SignUpView: UIView{

//    var signUp = SignUpView()
//    var firstTextField: String? {
//        didSet {
//            signUp.speaker = firstTextField ?? ""
//        }
//    }

    var firstTitle: InsideTitleAndTextField = {
        let first = InsideTitleAndTextField()
        first.titleLabel.text = "分享人: "
        return first
    }()

    var secondTitle: InsideTItleAndDatePicker = {
        let second = InsideTItleAndDatePicker()
        second.titleLabel.text = "日期: "
        return second
    }()
    var thirdTitle: InsideTitleAndDorpDownList = {
        let third = InsideTitleAndDorpDownList()
        third.titleLabel.text = "分類:"
        return third
    }()
    var fourTitle: InsideTitleAndTextField = {
        let four = InsideTitleAndTextField()
        four.titleLabel.text = "主題: "
        return four
    }()
    var fifthTitle: ImageAndTextField = {
        let fifth = ImageAndTextField()
        return fifth
    }()
    var sixTitle: InsideTitleAndSegmentedPicker = {
        let six = InsideTitleAndSegmentedPicker()
        six.titleLabel.text = "分享方式: "
        return six
    }()
    var tagTitle: InsideTitleAndTextField = {
        let tag = InsideTitleAndTextField()
        tag.titleLabel.text = "標籤: "
        return tag
    }()

    // MARK: 元件
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 24)
        titleLabel.text = "報名"
        titleLabel.tintColor = .white
        titleLabel.textAlignment = .center
        return titleLabel
    }()

    var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.textAlignment = .left
        textView.isEditable = true
        textView.isSelectable = true
        textView.text = ""
        textView.layer.borderWidth = 2
        textView.layer.borderColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        textView.layer.cornerRadius = 15
        textView.layer.masksToBounds = true
        return textView
    }()

    var tagView: UIView = {
        let tagView = UIView()
        tagView.backgroundColor = .blue
        return tagView
    }()

    let sendButton: UIButton = {
        let sendButton = UIButton()
        sendButton.setTitle("送出", for: .normal)
        sendButton.tintColor = .white
        sendButton.layer.cornerRadius = 15
        sendButton.layer.masksToBounds = true
        sendButton.backgroundColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        return sendButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setView() {
        let topStackView = UIStackView(arrangedSubviews: [titleLabel, firstTitle, secondTitle, thirdTitle, fourTitle, fifthTitle, sixTitle, tagTitle, tagView])
        topStackView.axis = .vertical
        topStackView.spacing = 20
        topStackView.distribution = .fill
        addSubview(topStackView)
        addSubview(sendButton)
        addSubview(textView)
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(15)
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
        }
        tagView.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        textView.snp.makeConstraints { make in
            make.top.equalTo(topStackView.snp.bottom).offset(15)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(300)
            make.bottom.equalTo(sendButton.snp.top).offset(-15)
        }
        sendButton.snp.makeConstraints { make in
            make.leading.equalTo(175)
            make.trailing.equalTo(-175)
            make.bottom.equalToSuperview().offset(-20)
        }
    }






}
