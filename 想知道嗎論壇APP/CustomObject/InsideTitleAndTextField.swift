//
//  InsideTitleAndTextField.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/22.
//

import UIKit

class InsideTitleAndTextField: UIView {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.tintColor = .white
        titleLabel.text = ""
        titleLabel.textAlignment = .right
        return titleLabel
    }()
    
    var textField: UITextField = {
        var textField = UITextField()
        textField.clearButtonMode = .whileEditing
        textField.font = .systemFont(ofSize: 18)
        textField.textColor = .black
        textField.borderStyle = .roundedRect
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
        let labelAndTextFieldStackView: UIStackView = {
           let labelAndTextFieldStackView = UIStackView(arrangedSubviews: [titleLabel, textField])
            labelAndTextFieldStackView.axis = .horizontal
            labelAndTextFieldStackView.distribution = .fillEqually
            labelAndTextFieldStackView.spacing = 10
            return labelAndTextFieldStackView
        }()
        addSubview(labelAndTextFieldStackView)
        labelAndTextFieldStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
