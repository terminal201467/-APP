//
//  Footer.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/1.
//

import UIKit

class Footer: UITableViewHeaderFooterView {
    
    static let reuseIdentifier = "Footer"

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
