//
//  SignUpViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let signUpView = SignUpView()
    
    override func loadView() {
        super.loadView()
        view = signUpView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setDropDownListAction()
        // Do any additional setup after loading the view.
    }
    
    private func setDropDownListAction(){
        signUpView.kindChooser.kindPicker.addTarget(self, action: #selector(drop), for: .touchUpInside)
    }
    
    @objc func drop(sender: UIButton) {
        signUpView.kindChooser.dropDownList.dataSource = ["請選擇分類", "專案經驗", "學習小心得", "技術剖析", "職場工作", "生活頻道"]
        signUpView.kindChooser.dropDownList.anchorView = sender
        signUpView.kindChooser.dropDownList.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        signUpView.kindChooser.dropDownList.show() //7
        signUpView.kindChooser.dropDownList.selectionAction = { [weak self] (index: Int, item: String) in
            guard let _ = self else { return }
            sender.setTitle(item, for: .normal)
        }
    }
}
