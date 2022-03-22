////
////  InsideTitleAndDorpDownList.swift
////  想知道嗎論壇APP
////
////  Created by Jhen Mu on 2022/3/22.
////
//
//import UIKit
//
//class InsideTitleAndDorpDownList: UIView {
//
//    let titleLabel: UILabel = {
//        let titleLabel = UILabel()
//        titleLabel.font = .systemFont(ofSize: 18)
//        titleLabel.tintColor = .white
//        titleLabel.text = ""
//        titleLabel.textAlignment = .right
//        return titleLabel
//    }()
//
//    var dropDownList: DropDown = {
//        let dropDownList = DropDown()
//        dropDownList.direction = .bottom
//        dropDownList.dismissMode = .onTap
//        dropDownList.textColor = .black
//        dropDownList.textFont = .systemFont(ofSize: 18)
//        dropDownList.backgroundColor = .white
//        dropDownList.selectedTextColor = .white
//        dropDownList.selectionBackgroundColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
////        dropDownList.cellHeight = 35
//        dropDownList.cornerRadius = 10
////        dropDownList.width = 200
//        return dropDownList
//
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setView() {
//        let view = UIButton()
//        view.setTitleColor(.black, for: .normal)
//        view.layer.cornerRadius = 10
//        view.layer.masksToBounds = true
//        view.layer.borderWidth = 2
//        view.layer.borderColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
//        view.setTitle("請選擇分類", for: .normal)
//        addSubview(view)
//        dropDownList.anchorView = view
//        view.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        view.addTarget(self, action: #selector(didtap), for: .touchUpInside)
//
//
//        let titleAndDropDownListStackView = UIStackView(arrangedSubviews: [titleLabel, view])
//        titleAndDropDownListStackView.axis = .horizontal
//        titleAndDropDownListStackView.spacing = 10
//        titleAndDropDownListStackView.distribution = .fillEqually
//        addSubview(titleAndDropDownListStackView)
//        titleAndDropDownListStackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//    }
//
//    @objc private func didtap(sender: UIButton) {
//        dropDownList.dataSource = ["請選擇分類", "專案經驗", "學習小心得", "技術剖析", "職場工作", "生活頻道"]//4
//        dropDownList.anchorView = sender //5
//        dropDownList.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
//        dropDownList.show() //7
//        dropDownList.selectionAction = { [weak self] (index: Int, item: String) in //8
//            guard let _ = self else { return }
//            sender.setTitle(item, for: .normal) //9
//        }
//    }
//
//
//
//}
