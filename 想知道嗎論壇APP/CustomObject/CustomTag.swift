//
//  CustomTag.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/4/2.
//

import Foundation
import UIKit


class CustomTag:UILabel{
    
    var topInset:CGFloat = 3
    var rightInset:CGFloat = 5
    var leftInset:CGFloat = 5
    var bottomInset:CGFloat = 3

    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
        
    }
    
    override var intrinsicContentSize: CGSize{
        get{
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
}
