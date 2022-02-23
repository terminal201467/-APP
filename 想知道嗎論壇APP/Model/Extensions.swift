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

extension Array {
    func oneFourSplit()->[[Element]]{
        let topCell = self[0]
        let bottomCell = self[1...4]
        return [Array(arrayLiteral: topCell), Array(bottomCell)]
    }
    
    func twoThreeSplit() -> [[Element]] {
        let topCell = self[0...2]
        let bottomCell = self[3...4]
        return [Array(topCell), Array(bottomCell)]
    }
    
    func threeTwoSplit()-> [[Element]]{
        let topCell = self[0...1]
        let bottomCell = self[2...4]
        return [Array(topCell), Array(bottomCell)]
    }
    
    func fourOneSplit()->[[Element]]{
        let topCell = self[0...3]
        let bottomCell = self[4]
        return [Array(topCell),Array(arrayLiteral: bottomCell)]
    }
}
