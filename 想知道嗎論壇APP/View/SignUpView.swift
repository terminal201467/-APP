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
    // MARK: 元件
    private let title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.text = "報名"
        label.tintColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let greenLine:UIView = {
       let view = UIView()
        view.layer.backgroundColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        view.layer.cornerRadius = 5
        return view
    }()

    let speechPersonColumn: LabelWithTextField = {
        let infoInputColumn = LabelWithTextField()
        infoInputColumn.title.text = "分享人："
        return infoInputColumn
    }()

    let speechDatePicker: LabelWithDatePicker = {
        let dateLabel = LabelWithDatePicker()
        dateLabel.title.text = "日期："
        return dateLabel
    }()
    let kindChooser: LabelWithDropDown = {
        let labelWithDropDown = LabelWithDropDown()
        labelWithDropDown.title.text = "分類："
        return labelWithDropDown
    }()
    let themeColumn: LabelWithTextField = {
        let infoInputColumn = LabelWithTextField()
        infoInputColumn.title.text = "主題："
        return infoInputColumn
    }()
    
    let linkInfo: LinkWithTextField = {
        let imageWithTextField = LinkWithTextField()
        return imageWithTextField
    }()
    
    let speechFormChooser: LabelWithSegmentedControl = {
        let labelSegmented = LabelWithSegmentedControl()
        labelSegmented.title.text = "分享方式："
        return labelSegmented
    }()
    
    let tags: LabelWithTextField = {
        let infoInputColumn = LabelWithTextField()
        infoInputColumn.title.text = "標籤："
        return infoInputColumn
    }()
    
    let  tagButtons: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = .zero
        flowLayout.estimatedItemSize = .init(width: 60, height: 30)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(TagCell.self, forCellWithReuseIdentifier: TagCell.reuseIdentifier)
        collectionView.allowsSelection = true
        collectionView.isScrollEnabled = false
        collectionView.contentMode = .scaleAspectFit
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentSize = .init(width: 200, height: 100)
        collectionView.contentOffset = .init(x: 10, y: 10)
        return collectionView
    }()

    let textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.textAlignment = .left
        textView.isEditable = true
        textView.isSelectable = true
        textView.layer.borderWidth = 2
        textView.layer.borderColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        textView.layer.cornerRadius = 15
        textView.layer.masksToBounds = true
        return textView
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
    
    private lazy var titleStackView:UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [title,greenLine])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    //Warning:need to adjusted
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [speechPersonColumn, speechDatePicker, kindChooser, themeColumn, linkInfo, speechFormChooser, tags, tagButtons])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleStackView)
        addSubview(stackView)
        addSubview(textView)
        addSubview(sendButton)
        backgroundColor = .white
        autoLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func autoLayout() {
        titleStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(15)
            make.centerX.equalToSuperview()
        }
        greenLine.snp.makeConstraints { make in
            make.height.equalTo(5)
            make.width.equalTo(100)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleStackView.snp.bottom).offset(10)
            make.leading.equalTo(10)
            make.trailing.equalTo(-60)
        }
        
        tagButtons.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.height.equalTo(80)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.bottom.equalTo(sendButton.snp.top).offset(-10)
        }
        
        sendButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.bottom.equalToSuperview().offset(-40)
        }
    }
}
