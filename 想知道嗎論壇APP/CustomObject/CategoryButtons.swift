//
//  CollectionButton.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/15.
//

import UIKit

class CategoryButtons: UICollectionViewController{
    //MARK:-Properties
    private let flowLayout = UICollectionViewFlowLayout()
    
    private let ariticles = ArticleKind.allCases
    
    var category = ""
    
    //MARK:-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewFlow()
        setCollectionView()
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
    
    @objc func learnMemo(){
        category = ArticleKind.learnMemo.text
        //getAPIByParameter學習小心得
    }

    @objc func lifeChannel(){
        category = ArticleKind.lifeChannel.text
        
    }

    @objc func projectExperience(){
        category = ArticleKind.projectExperiance.text
        
    }

    @objc func skillResearch(){
        category = ArticleKind.skillResearch.text
    }

    @objc func workLife(){
        category = ArticleKind.workLife.text
    }

    // MARK:-UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ariticles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCell.reuseIdentifier, for: indexPath) as! ThemeCell
        print("Cell:",collectionView.visibleCells)
        
        let articleKinds = ariticles[indexPath.row]
        switch articleKinds.self {
        case .projectExperiance:
            cell.button.setTitle(ArticleKind.projectExperiance.text, for: .normal)
            cell.button.addTarget(self, action: #selector(projectExperience), for: .touchDown)
        case .learnMemo:
            cell.button.setTitle(ArticleKind.learnMemo.text, for: .normal)
            cell.button.addTarget(self, action: #selector(learnMemo), for: .touchDown)
        case .skillResearch:
            cell.button.setTitle(ArticleKind.skillResearch.text, for: .normal)
            cell.button.addTarget(self, action: #selector(skillResearch), for: .touchDown)
        case .workLife:
            cell.button.setTitle(ArticleKind.workLife.text, for: .normal)
            cell.button.addTarget(self, action: #selector(workLife), for: .touchDown)
        case .lifeChannel:
            cell.button.setTitle(ArticleKind.lifeChannel.text, for: .normal)
            cell.button.addTarget(self, action: #selector(lifeChannel), for: .touchDown)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
                cell?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}
