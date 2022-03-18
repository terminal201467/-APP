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
    
    var tags:[String] = ["前端","CSS","JS","Coding","樂布朗粒子砲"]
    
    var tag:String = ""
    
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
        return tags.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.reuseIdentifier, for: indexPath) as! TagCell
        cell.tagLabel.text = tags[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tag = tags[indexPath.row]
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TagCell
        UIView.animate(withDuration: 0.2) {
            cell.tagLabel.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TagCell
        UIView.animate(withDuration: 0.2) {
            cell.tagLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }

}
