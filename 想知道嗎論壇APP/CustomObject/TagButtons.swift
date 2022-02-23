//
//  TagButtons.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/17.
//

import UIKit

private let reuseIdentifier = "Cell"

class TagButtons: UICollectionViewController {
    
    //MARK:-Properties
    
    let flowLayout = UICollectionViewFlowLayout()
    
    var buttonNames:[String] = ["前端","CSS","JS","Coding","樂布朗粒子砲"]
    
    //MARK:-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewFlow()
        setCollectionView()
    }
    
    //MARK:-setCollectionView
    
    private func setCollectionViewFlow(){
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.estimatedItemSize = .zero
    }
    
    private func setCollectionView(){
        collectionView.register(TagCell.self, forCellWithReuseIdentifier:TagCell.reuseIdentifier)
        collectionView.allowsSelection = true
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    //MARK:-UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.reuseIdentifier, for: indexPath) as! TagCell
        let buttons = buttonNames[indexPath.row]
        cell.button.setTitle(buttons, for: .normal)
        return cell
    }

}
