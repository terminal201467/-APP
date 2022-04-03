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
import SwiftUI

class HomePageViewController: UIViewController{

    //MARK:-Properties
    private let homePageView = HomePageView()
    
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuTableViewController())
    
    private let pagingViewController = PagingViewController()
    
    private let resultController = KeywordResultTableController()
    
    private var searchViewController:UISearchController?
    
    private let viewControllers:[UIViewController] = { () -> [UIViewController] in
        let bulletinViewController = BulletinViewController()
        let xiangZhiDaoMaViewController = BulletinViewController()
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
        setSearchViewController()
        setSideMenu()
        setPageViewController()
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
        navigationItem.titleView = NavigationBarTitle()
        navigationItem.searchController?.searchBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        navigationItem.searchController?.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.searchController?.isActive = true
        
        let leftSideMenuButton = UIBarButtonItem(image: UIImage(named: "line.3.horizontal"),
                                                 style: .plain,
                                                 target:self,
                                                 action: #selector(sideMenuButtonMethod))
        
        let rightButton = UIBarButtonItem(image: UIImage(named: "magnifyingglass"), style: .plain, target: self, action: #selector(search))
        navigationItem.leftBarButtonItem = leftSideMenuButton
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
    }
    
    private func setSearchViewController(){
        searchViewController = UISearchController(searchResultsController: UINavigationController(rootViewController:resultController))
        homePageView.searchBarContainer.addSubview(searchViewController!.searchBar)
        searchViewController?.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchViewController?.hidesNavigationBarDuringPresentation = false
        searchViewController?.obscuresBackgroundDuringPresentation = false
        searchViewController?.searchBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        searchViewController?.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchViewController?.searchBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchViewController?.searchBar.searchTextField.layer.cornerRadius = 50
        searchViewController?.searchBar.searchTextField.keyboardAppearance = .light
        searchViewController?.searchBar.isTranslucent = false
        searchViewController?.searchBar.delegate = self
        searchViewController?.showsSearchResultsController = false
        searchViewController?.searchResultsUpdater = resultController
        searchViewController?.searchBar.searchTextField.delegate = self
        searchViewController?.automaticallyShowsSearchResultsController = false
        searchViewController?.obscuresBackgroundDuringPresentation = true
    }
    
    @objc func sideMenuButtonMethod(){
        present(sideMenu, animated: true, completion: nil)
    }
    
    @objc func search(){
        homePageView.searchBarContainer.isHidden.toggle()
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

extension HomePageViewController:UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        resultController.dataBase.removeAll()
        searchViewController?.showsSearchResultsController = false
        homePageView.searchBarContainer.isHidden = true
    }
}

extension HomePageViewController:UISearchTextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        searchViewController?.showsSearchResultsController = true
        resultController.keyword = textField.text!
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        resultController.dataBase.removeAll()
        return true
    }
}
