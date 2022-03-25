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
    
    private let resultController = WannaKnowResultTableController()
    
    private let contentViewController = ContentViewController()
    
    private let calendarViewController = CalenderViewController()
    
    private var searchViewController:UISearchController!
    
    private lazy var segmentedControllers:[UIViewController] = [contentViewController,calendarViewController]
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    //MARK:-store properties
    private var theme:String = ""

    private var tag:String = ""
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = wannaKnowView
        view.backgroundColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setSearchViewController()
        setSideMenu()
        setSegmented()
        setPageViewController()
        setResultControllerDelegate()
        
    }
    
    private func setResultControllerDelegate(){
        contentViewController.categoryButton.delegate = self
        contentViewController.contentViewController.tagButtons.delegate = self
        contentViewController.followViewController.tagButtons.delegate = self
        contentViewController.hotViewController.tagButtons.delegate = self
    }
    
    private func setPageViewController(){
        add(pageViewController)
        pageViewController.view.snp.makeConstraints { make in
            make.right.left.top.bottom.equalTo(wannaKnowView.contentCalenderContainerView)
        }
        
        guard let vc = setPageViewController(page: wannaKnowView.segmentedControl.selectedSegmentIndex) else { return }
        
        pageViewController.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self
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
        navigationItem.titleView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backToHomePage)))
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
    
    @objc func sideMenuButtonMethod(){
        present(sideMenu, animated: true, completion: nil)
    }
    
    @objc func search(){
        wannaKnowView.searchBarContainer.isHidden.toggle()
    }
    
    @objc func backToHomePage(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setSegmented(){
        wannaKnowView.segmentedControl.addTarget(self, action: #selector(changePage), for: .valueChanged)
    }

    @objc func changePage(){
        pageViewController.setViewControllers([segmentedControllers[wannaKnowView.segmentedControl.selectedSegmentIndex]], direction: .forward, animated: true, completion: nil)
    }
    
    private func setSearchViewController(){
        searchViewController = UISearchController(searchResultsController:UINavigationController(rootViewController: resultController))
        wannaKnowView.searchBarContainer.addSubview(searchViewController.searchBar)
        searchViewController.delegate = self
        searchViewController.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchViewController.hidesNavigationBarDuringPresentation = false
        searchViewController.obscuresBackgroundDuringPresentation = false
        searchViewController.searchBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        searchViewController.searchBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchViewController.searchBar.placeholder = "想搜尋..."
        searchViewController.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchViewController.searchBar.searchTextField.layer.cornerRadius = 50
        searchViewController.searchBar.searchTextField.keyboardAppearance = .light
        searchViewController.searchBar.isTranslucent = false
        searchViewController.searchBar.delegate = self
        searchViewController.searchResultsUpdater = resultController
        searchViewController.automaticallyShowsSearchResultsController = true
        searchViewController.obscuresBackgroundDuringPresentation = true
    }
    
    //MARK:-setPageViewController's page
    private func setPageViewController(page:Int)->UIViewController?{
        return page < 0 || page > 1 ? nil : segmentedControllers[page]
    }
}



extension WannaKnowViewController:UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let beforePage = wannaKnowView.segmentedControl.selectedSegmentIndex - 1
        return setPageViewController(page: beforePage)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let afterPage = wannaKnowView.segmentedControl.selectedSegmentIndex + 1
        return setPageViewController(page: afterPage)
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
               let currentVC = pageViewController.viewControllers?.first,
               let index = segmentedControllers.firstIndex(of: currentVC) else { return }
        wannaKnowView.segmentedControl.selectedSegmentIndex = index
    }
}

//MARK:-searchViewControllerDelegate
extension WannaKnowViewController:UISearchControllerDelegate{
    func didDismissSearchController(_ searchController: UISearchController) {     
        wannaKnowView.searchBarContainer.isHidden = true
        resultController.dataBase.removeAll()
        theme = ""
        tag = ""
        resultController.dataBase.loadAllData()
    }
}

//MARK:-searchBarDelegate
extension WannaKnowViewController:UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resultController.dataBase.removeAll()
        theme = ""
        tag = ""
        resultController.dataBase.loadAllData()
    }
}

//MARK:-ThemeDelegate
extension WannaKnowViewController:ThemeDelegate{
    func receiveThemeParameter(theme paramter: String) {
        theme = paramter
        searchViewController.searchBar.becomeFirstResponder()
    }
}

//MARK:-TagDelegate
extension WannaKnowViewController:TagDelegate{
    func receiveTagDelegate(tag paramter: String) {
        tag = paramter
        searchViewController.searchBar.becomeFirstResponder()
    }
}
