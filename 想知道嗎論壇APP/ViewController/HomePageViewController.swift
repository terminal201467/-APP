//
//  ViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit
import SideMenu
import SnapKit
import Parchment

class HomePageViewController: UIViewController {
    
    //MARK:-Properties
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuTableViewController())
    
    private let homePageView = HomePageView()
    
    private let pageViewController = PagingViewController()
    
    private let viewControllers:[UIViewController] = { () -> [UIViewController] in
        let bulletinViewController = BulletinTableViewController()
        let xiangZhiDaoMaViewController = BulletinTableViewController()
        let chiaoWanViewController = ChiaoWanViewController()
        return [bulletinViewController,xiangZhiDaoMaViewController,chiaoWanViewController]
    }()
    
    //MARK:-LifeCyCle
    override func loadView() {
        super.loadView()
        view = homePageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setSideMenu()
        setSearchBar()
        setPageViewController()
        setKeyboardSetting()
        
    }
    
    //MARK:-setSideMenu
    private func setSideMenu(){
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    //MARK:-setNavigationBar
    private func setNavigationBar(){
        let leftSideMenuButton = UIBarButtonItem(image: UIImage(named: "line.3.horizontal"),
                                                 style: .plain,
                                                 target:self,
                                                 action: #selector(sideMenuButtonMethod))
        
        self.navigationItem.leftBarButtonItem = leftSideMenuButton
    }
    
    @objc func sideMenuButtonMethod(){
        present(sideMenu, animated: true, completion: nil)
    }
    
    //MARK:-setSearchBar
    private func setSearchBar(){
        homePageView.searchBar.delegate = self
    }
    
    //MARK:-setPageViewController
    private func setPageViewController(){
        pageViewController.delegate = self
        pageViewController.dataSource = self
        add(pageViewController)
        pageViewController.view.snp.makeConstraints { make in
            make.top.right.left.bottom.equalTo(homePageView.menuPageContainer)
        }
    }
    
    private func setKeyboardSetting(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.homePageView.banner.addGestureRecognizer(tap)
    }

    @objc func dismissKeyBoard() {
            self.view.endEditing(true)
    }
    
}

extension HomePageViewController:SideMenuNavigationControllerDelegate{
    
    
}

extension HomePageViewController:UISearchBarDelegate{
    
    
}

//MARK:PagingViewControllerDelegate
extension HomePageViewController:PagingViewControllerDelegate,PagingViewControllerDataSource{
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return viewControllers.count
    }
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: MenuPageName.allCases[index].title)
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllers[index]
    }
}

