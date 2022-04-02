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
    
    private let contentViewController = ContentViewController()
    
    private let calendarViewController = CalenderViewController()
    
    private var searchViewController:UISearchController!
    
    private lazy var segmentedControllers:[UIViewController] = [contentViewController,calendarViewController]
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    private var categoryIndex = IndexPath(){
        didSet{
            exSelectIndex.append(categoryIndex)
        }
    }
    
    private var exSelectIndex:[IndexPath] = []{
        didSet{
            contentViewController.categoryButton.collectionView(contentViewController.categoryButton.collectionView, didUnhighlightItemAt: exSelectIndex[0])
            if exSelectIndex.count > 1{ exSelectIndex.remove(at: 0) }
        }
    }
    
    //MARK:-store properties
    private var theme:String = ""{
        didSet{
            print("回傳主題")
            contentViewController.categoryButton.collectionView(contentViewController.categoryButton.collectionView, didHighlightItemAt: categoryIndex)
            //postNotification
            postTheme()
            //I can sure that trigger , but why can't work?
            
            searchViewController.searchBar.searchTextField.resignFirstResponder()
            searchViewController.searchBar.isHidden = true
        }
    }
    
    private var tag:String = ""
    
    private var page:Int = 0{
        didSet{
            print("page:",page)
        }
    }
    
    private let aricles = ArticlePages.allCases
    
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
        setCategoryDelegate()
        setSelfCategoryDelegate()
        setTagDelegate()
        setContentViewControllerOberserver()
        categoryIndex = [0,0]
        contentViewController.categoryButton.collectionView(contentViewController.categoryButton.collectionView, didHighlightItemAt: categoryIndex)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setResultUpdaterDelegate()
    }
    
    private func postTheme(){
        NotificationCenter.default.post(name: .deliverTheCategory, object: nil, userInfo: [NotificationInfo.theme:self.theme])
    }
    
    private func setContentViewControllerOberserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(receiveTheContentPage(page:)), name: .deliverTheContentPage, object: nil)
    }
    
    @objc func receiveTheContentPage(page:Notification){
        if let userInfo = page.userInfo,
           let page = userInfo[NotificationInfo.page] {
            self.page = page as! Int
            print("page:",self.page)
        }
    }
    
    private func setCategoryDelegate(){
        contentViewController.categoryButton.delegate = contentViewController.newViewController
        contentViewController.categoryButton.delegate = contentViewController.hotViewController
        contentViewController.categoryButton.delegate = contentViewController.followViewController
    }
    
    private func setSelfCategoryDelegate(){
        contentViewController.categoryButton.delegate = self
    }
    
    private func setTagDelegate(){
        contentViewController.newViewController.tagButtons.delegate = contentViewController.newViewController
        contentViewController.followViewController.tagButtons.delegate = contentViewController.hotViewController
        contentViewController.hotViewController.tagButtons.delegate = contentViewController.followViewController
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
        wannaKnowView.searchBarContainer.isHidden = false
        searchViewController.searchBar.isHidden = false
        searchViewController.searchBar.becomeFirstResponder()
        categoryIndex = [0,0]
        contentViewController.categoryButton.collectionView(contentViewController.categoryButton.collectionView, didHighlightItemAt: categoryIndex)
        contentViewController.categoryButton.collectionView.scrollToItem(at: categoryIndex, at: .centeredHorizontally, animated: true)
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
        searchViewController = UISearchController(searchResultsController:nil)
        wannaKnowView.searchBarContainer.addSubview(searchViewController.searchBar)
        searchViewController.delegate = self
        searchViewController.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchViewController.hidesNavigationBarDuringPresentation = false
        searchViewController.searchBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        searchViewController.searchBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchViewController.searchBar.placeholder = "想搜尋..."
        searchViewController.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchViewController.searchBar.searchTextField.layer.cornerRadius = 50
        searchViewController.searchBar.searchTextField.keyboardAppearance = .light
        searchViewController.searchBar.searchTextField.delegate = self
        searchViewController.searchBar.isTranslucent = false
        searchViewController.searchBar.delegate = self
        searchViewController.automaticallyShowsSearchResultsController = true
        searchViewController.obscuresBackgroundDuringPresentation = false
    }
    
    //MARK:-setPageViewController's page
    private func setPageViewController(page:Int)->UIViewController?{
        return page < 0 || page > 1 ? nil : segmentedControllers[page]
    }
    
    private func setResultUpdaterDelegate(){
        print("index:",self.page)
        switch self.page{
        case 0: searchViewController.searchResultsUpdater = contentViewController.newViewController
            print("resulteUpdater:new")
        case 1: searchViewController.searchResultsUpdater = contentViewController.hotViewController
            print("resulteUpdater:hot")
        case 2: searchViewController.searchResultsUpdater = contentViewController.followViewController
            print("resulteUpdater:follow")
        default: print("Default")
        }
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
    }
}

//MARK:-searchBarDelegate
extension WannaKnowViewController:UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        categoryIndex = [0,0]
        contentViewController.categoryButton.collectionView(contentViewController.categoryButton.collectionView, didUnhighlightItemAt: categoryIndex)
    }
}

extension WannaKnowViewController:UISearchTextFieldDelegate{
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wannaKnowView.searchBarContainer.isHidden = true
        self.view.endEditing(true)
        return true
    }
}

//MARK:-ThemeDelegate
extension WannaKnowViewController:ThemeDelegate{
    func receiveIndexParameter(index parameter: IndexPath) {
        categoryIndex = parameter
    }
    
    func receiveThemeParameter(theme paramter: String) {
        theme = paramter
    }
}

//MARK:-TagDelegate
extension WannaKnowViewController:TagDelegate{
    func receiveTagDelegate(tag paramter: String) {
        tag = paramter
    }
}
