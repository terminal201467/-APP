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
    
    let resultController = ResultTableViewController()
    
    private var searchViewController:UISearchController!
    
    let contentViewController = ContentViewController()
    
    let calendarViewController = CalenderViewController()
    
    private lazy var segmentedControllers:[UIViewController] = [contentViewController,calendarViewController]
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)


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
        setCategoryValue()
    }
    
    private func setCategoryValue(){
        resultController.category = contentViewController.categoryButton.category
    }
    
    private func setPageViewController(){
        add(pageViewController)
        pageViewController.view.snp.makeConstraints { make in
            make.right.left.top.bottom.equalTo(wannaKnowView.contentCalenderContainerView)
        }
        
        guard let vc = setPageViewController(page: wannaKnowView.segmentedControl.selectedSegmentIndex) else { return }
        
        pageViewController.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
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
        self.navigationItem.titleView = NavigationBarTitle()
        navigationItem.titleView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backToHomePage)))
        
        let leftSideMenuButton = UIBarButtonItem(image: UIImage(named: "line.3.horizontal"),
                                                 style: .plain,
                                                 target:self,
                                                 action: #selector(sideMenuButtonMethod))
        let rightSideMenuButton = UIBarButtonItem(image:UIImage(named: "magnifyingglass"), style: .plain, target: self, action: #selector(search))
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = leftSideMenuButton
        self.navigationItem.rightBarButtonItem = rightSideMenuButton
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
        searchViewController = UISearchController(searchResultsController: resultController)
        wannaKnowView.searchBarContainer.addSubview(searchViewController.searchBar)
        searchViewController.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchViewController.hidesNavigationBarDuringPresentation = false
        searchViewController.obscuresBackgroundDuringPresentation = false
        searchViewController.searchBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        searchViewController.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchViewController.searchBar.searchTextField.layer.cornerRadius = 50
        searchViewController.searchBar.searchTextField.keyboardAppearance = .light
        searchViewController.searchBar.isTranslucent = false
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

