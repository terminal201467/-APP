//
//  ContentViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit
import Parchment
import SnapKit

class ContentViewController: UIViewController {
    //MARK:-Properties
    
    private let pagingViewController = PagingViewController()
    
    private let viewControllers:[UIViewController] = {
       let contentViewController = WannaKnowListViewController()
       let hotViewController = WannaKnowListViewController()
        let followViewController = WannaKnowListViewController()
        return [contentViewController,hotViewController,followViewController]
    }()
    
    private let contentView = ContentView()
    
    public let categoryButton = CategoryButtons(collectionViewLayout: UICollectionViewFlowLayout())
    
    //MARK:-LifeCycle
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setPagingViewController()
        setCollectionButtons()
    }
    
    private func setCollectionButtons(){
        add(categoryButton)
        categoryButton.view.snp.makeConstraints { make in
            make.top.right.left.bottom.equalTo(contentView.ThemeButtonContainer)
        }
    }
    
    private func setPagingViewController(){
        pagingViewController.delegate = self
        pagingViewController.dataSource = self
        pagingViewController.selectedBackgroundColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
        pagingViewController.selectedTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pagingViewController.indicatorColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        pagingViewController.menuBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        add(pagingViewController)
        pagingViewController.view.snp.makeConstraints { make in
            make.right.left.top.bottom.equalTo(contentView.menuContainer)
        }
    }
}

extension ContentViewController:PagingViewControllerDelegate,PagingViewControllerDataSource{
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return viewControllers.count
    }

    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllers[index]
    }

    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: ArticlePages.allCases[index].text)
    }
}
