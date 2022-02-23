//
//  CollectionButton.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/15.
//

import UIKit

class ThemeButtons: UICollectionViewController{
    //MARK:-Properties
    
    let flowLayout = UICollectionViewFlowLayout()
    
    let ariticles = ArticleKind.allCases
    
    //MARK:-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setCollectionViewFlow()
    }
    
    //MARK:-setCollectionView
    private func setCollectionViewFlow(){
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
//        flowLayout.estimatedItemSize = .init(width: 120, height: 30)
        flowLayout.itemSize = .init(width: 110, height: 30)
    }
    
    private func setCollectionView(){
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
        collectionView.register(ThemeCell.self, forCellWithReuseIdentifier: ThemeCell.reuseIdentifier)
        collectionView.allowsSelection = false
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.showsHorizontalScrollIndicator = false
    }

    // MARK:-UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ariticles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCell.reuseIdentifier, for: indexPath) as! ThemeCell
        let articleKinds = ariticles[indexPath.row]
        switch articleKinds.self {
        case .learnMemo:
            cell.button.setTitle(ArticleKind.learnMemo.text, for: .normal)
        case .lifeChannel:
            cell.button.setTitle(ArticleKind.lifeChannel.text, for: .normal)
        case .projectExperiance:
            cell.button.setTitle(ArticleKind.projectExperiance.text, for: .normal)
        case .skillResearch:
            cell.button.setTitle(ArticleKind.skillResearch.text, for: .normal)
        case .workLife:
            cell.button.setTitle(ArticleKind.workLife.text, for: .normal)
        }
        return cell
    }
}
