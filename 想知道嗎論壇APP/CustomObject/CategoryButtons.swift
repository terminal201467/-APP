//
//  CollectionButton.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/15.
//

import UIKit

protocol CategoryValueDelegate:AnyObject {
    func categoryValue(pass by:String)
}

class CategoryButtons: UICollectionViewController{
    //MARK:-Properties
    
    private let flowLayout = UICollectionViewFlowLayout()
    
    private let ariticles = ArticleKind.allCases
    
    weak var delegate:CategoryValueDelegate!
    
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
        flowLayout.itemSize = .init(width: 110, height: 30)
    }
    
    private func setCollectionView(){
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
        collectionView.register(ThemeCell.self, forCellWithReuseIdentifier: ThemeCell.reuseIdentifier)
        collectionView.allowsSelection = false
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    @objc func learnMore(){
        delegate.categoryValue(pass:ArticleKind.learnMemo.text)
    }
    
    @objc func lifeChannel(){
        delegate.categoryValue(pass:ArticleKind.lifeChannel.text)
    }
    
    @objc func projectExperience(){
        delegate.categoryValue(pass:ArticleKind.projectExperiance.text)
    }
    
    @objc func skillResearch(){
        delegate.categoryValue(pass: ArticleKind.skillResearch.text)
    }
    
    @objc func workLife(){
        delegate.categoryValue(pass: ArticleKind.workLife.text)
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
            cell.button.target(forAction: #selector(learnMore), withSender: self)
        case .lifeChannel:
            cell.button.setTitle(ArticleKind.lifeChannel.text, for: .normal)
            cell.button.target(forAction: #selector(lifeChannel), withSender: self)
        case .projectExperiance:
            cell.button.setTitle(ArticleKind.projectExperiance.text, for: .normal)
            cell.button.target(forAction: #selector(projectExperience), withSender: self)
        case .skillResearch:
            cell.button.setTitle(ArticleKind.skillResearch.text, for: .normal)
            cell.button.target(forAction: #selector(skillResearch), withSender: self)
        case .workLife:
            cell.button.setTitle(ArticleKind.workLife.text, for: .normal)
            cell.button.target(forAction: #selector(workLife), withSender: self)
        }
        return cell
    }
}
