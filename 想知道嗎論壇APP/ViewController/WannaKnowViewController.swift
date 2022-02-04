//
//  WannaKnowViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit
import SideMenu
import Parchment

class WannaKnowViewController: UIViewController {
    
    //MARK:-Properties
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuTableViewController())
    
    private let wannaKnowView = WannaKnowView()
    
    private let pageViewController = PagingViewController()
    
    private let viewControllers:[UIViewController] = {
       let contentViewController = ContentViewController()
       let hotViewController = ContentViewController()
        let followViewController = ContentViewController()
        return [contentViewController,hotViewController,followViewController]
    }()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = wannaKnowView
        view.backgroundColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setSideMenu()
        setNavigationBar()
        setSegmented()
        setPagingViewController()
    }
    
    //MARK:-setSideMenu
    private func setSideMenu(){
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    //MARK:-setNavigationBar
    private func setNavigationBar(){
        self.navigationItem.titleView = wannaKnowView.searchBar
        
        let leftSideMenuButton = UIBarButtonItem(image: UIImage(named: "line.3.horizontal"),
                                                 style: .plain,
                                                 target:self,
                                                 action: #selector(sideMenuButtonMethod))
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = leftSideMenuButton
    }
    
    @objc func sideMenuButtonMethod(){
        present(sideMenu, animated: true, completion: nil)
    }
    
    private func setSegmented(){
        wannaKnowView.segmentedControl.addTarget(self, action: #selector(changePage), for: .touchDown)
    }
    
    @objc func changePage(){
        
    }
    
    private func setPagingViewController(){
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.selectedBackgroundColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
        pageViewController.selectedTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pageViewController.indicatorColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        pageViewController.menuBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        add(pageViewController)
        pageViewController.view.snp.makeConstraints { make in
            make.right.left.top.bottom.equalTo(wannaKnowView.menuContainer)
        }
    }
}

extension WannaKnowViewController:PagingViewControllerDelegate,PagingViewControllerDataSource{
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
