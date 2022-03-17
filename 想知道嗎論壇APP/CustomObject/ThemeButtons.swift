//
//  CollectionButton.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/15.
//

import UIKit

class ThemeButtons: UICollectionViewController{
    //MARK:-Properties
    private let flowLayout = UICollectionViewFlowLayout()
    
    private let ariticles = ArticleKind.allCases
    
    var category = ""
    
    //MARK:-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewFlow()
        setCollectionView()
        print(category)
    }
    
    //MARK:-setCollectionView
    private func setCollectionViewFlow(){
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.itemSize = .init(width: 110, height: 30)
    }
    
    private func setCollectionView(){
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
        collectionView.register(ThemeCell.self, forCellWithReuseIdentifier: ThemeCell.reuseIdentifier)
        collectionView.allowsSelection = true
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isExclusiveTouch = true
    }
    
    private func animateCollectionView() {
            let cells = collectionView.visibleCells
            let collectionViewHeight: CGFloat = collectionView.bounds.size.height
            for (index, cell) in cells.enumerated() {
                cell.transform = CGAffineTransform(translationX: 0, y: collectionViewHeight)
                UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0);
                }, completion: nil)
            }

    }
    
    // MARK:-UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ariticles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCell.reuseIdentifier, for: indexPath) as! ThemeCell
        cell.category.text = ariticles[indexPath.row].text
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryKind = ariticles[indexPath.row]
        switch categoryKind {
        case .learnMemo:         category = categoryKind.text
        case .lifeChannel:       category = categoryKind.text
        case .projectExperiance: category = categoryKind.text
        case .skillResearch:     category = categoryKind.text
        case .workLife:          category = categoryKind.text
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ThemeCell
        UIView.animate(withDuration: 0.2) {
            cell.category.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            cell.category.layer.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ThemeCell
        UIView.animate(withDuration: 0.2) {
            cell.category.transform = CGAffineTransform(scaleX: 1, y: 1)
            cell.category.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}
