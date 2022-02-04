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
