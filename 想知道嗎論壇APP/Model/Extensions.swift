//
//  Extensions.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/20.
//

import UIKit
import SnapKit

extension UIViewController {
    func add(_ child:UIViewController){
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}

extension UIView{
    func autoLayout(_ view:UIView){
        view.snp.makeConstraints { make in
            make.right.left.top.bottom.equalToSuperview()
        }
    }
}
