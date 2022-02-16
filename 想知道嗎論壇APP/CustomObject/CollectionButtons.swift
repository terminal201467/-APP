//
//  CollectionButton.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/15.
//

import UIKit

class CollectionCell:UICollectionViewCell{
    
    static let reuseIdentifier = "ButtonCell"
    
    let button:UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.layer.backgroundColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(button)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        button.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
    }
    
}


class CollectionButtons: UICollectionViewController{
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
        flowLayout.minimumLineSpacing = 5
        flowLayout.itemSize = .init(width: 100, height: 30)
    }
    
    private func setCollectionView(){
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseIdentifier)
        collectionView.allowsSelection = false
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.showsHorizontalScrollIndicator = false
    }

    // MARK:-UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ariticles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseIdentifier, for: indexPath) as! CollectionCell
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
    

//    override func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
//        <#code#>
//    }
    
    //MARK:-setCollectionView
    

}
