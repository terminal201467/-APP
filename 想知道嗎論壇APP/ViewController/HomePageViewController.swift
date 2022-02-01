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
        self.navigationItem.titleView = NavigationTitleView()
        let leftSideMenuButton = UIBarButtonItem(image: UIImage(named: "line.3.horizontal"),
                                                 style: .plain,
                                                 target:self,
                                                 action: #selector(sideMenuButtonMethod))
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = leftSideMenuButton
        self.navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
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
        pageViewController.selectedBackgroundColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
        pageViewController.selectedTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pageViewController.indicatorColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        pageViewController.menuBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
        if self.view.frame.origin.y < 0{
            self.view.frame.origin.y = 0
        }
    }
    
}

extension HomePageViewController:SideMenuNavigationControllerDelegate{
    
    
}

extension HomePageViewController:UISearchBarDelegate{
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.resignFirstResponder()
        return true
    }
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

