//
//  LineUpButtonsCell.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/18.
//

import UIKit

class LineUpButtonsCell: UITableViewCell {
    
    static let reuseIdentifier:String = "LineUpButton"

    var buttonsName:[String] = []
    
    /// makeButtons
    /// - Parameter buttonsName: the intro parameter is a array from buttons
    /// - Returns: return a button's array
    private func makeButtons(buttons buttonsName:[String])->[UIButton]{
        let buttons = buttonsName.map { name -> UIButton in
            let button = UIButton()
            button.setTitle(name, for: .normal)
            button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            button.layer.borderColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
            button.layer.cornerRadius = 10
            button.titleEdgeInsets = .init(top: 0, left: 5, bottom: 0, right: 5)
            return button
        }
        return buttons
    }
    
    private lazy var buttonStackView:UIStackView = {
       let stackView = UIStackView(arrangedSubviews: makeButtons(buttons: buttonsName))
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(buttonStackView)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        buttonStackView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
    }
}
