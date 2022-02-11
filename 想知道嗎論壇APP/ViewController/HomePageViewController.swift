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
    
    private let pagingViewController = PagingViewController()
    
    private let searchViewController = UISearchController(searchResultsController: nil)
    
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
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        
        navigationItem.titleView = NavigationTitleView()
        navigationItem.searchController = searchViewController
        navigationItem.searchController?.searchBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        navigationItem.searchController?.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.searchController?.isActive = true
        
        let leftSideMenuButton = UIBarButtonItem(image: UIImage(named: "line.3.horizontal"),
                                                 style: .plain,
                                                 target:self,
                                                 action: #selector(sideMenuButtonMethod))
        navigationItem.leftBarButtonItem = leftSideMenuButton
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
    }
    
    @objc func sideMenuButtonMethod(){
        present(sideMenu, animated: true, completion: nil)
    }
    
    
    //MARK:-setPageViewController
    private func setPageViewController(){
        pagingViewController.delegate = self
        pagingViewController.dataSource = self
        pagingViewController.selectedBackgroundColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
        pagingViewController.selectedTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pagingViewController.indicatorColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        pagingViewController.menuBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        add(pagingViewController)
        pagingViewController.view.snp.makeConstraints { make in
            make.top.right.left.bottom.equalTo(homePageView.menuPageContainer)
        }
    }
    
    private func setKeyboardSetting(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.homePageView.banner.addGestureRecognizer(tap)
    }

    @objc func dismissKeyBoard() {
        self.view.endEditing(true)
        if viewControllers[2].view.frame.origin.y < 0{
            viewControllers[2].view.frame.origin.y = 0
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

