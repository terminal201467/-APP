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
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
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


class CollectionButtons: UICollectionViewController {
    
    let articleKind = ArticleKind.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    //MARK:-setCollectionView
    func setCollectionView(){
        self.collectionView!.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseIdentifier)
        collectionView.allowsSelection = true
        
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseIdentifier, for: indexPath) as! CollectionCell
//        switch articleKind.self {
//        case .projectExperiance:
//            cell.button.setTitle(ArticleKind.projectExperiance.text, for: .normal)
//        case .learnMemo:
//            cell.button.setTitle(ArticleKind.learnMemo.text, for: .normal)
//        case .skillResearch:
//            cell.button.setTitle(ArticleKind.skillResearch.text, for: .normal)
//        case .lifeChannel:
//            cell.button.setTitle(ArticleKind.lifeChannel.text, for: .normal)
//        case .workLife:
//            cell.button.setTitle(ArticleKind.workLife.text, for: .normal)
//        }
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
