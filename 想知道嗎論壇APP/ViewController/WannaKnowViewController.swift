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
    
    private let pageViewController = PageViewController()
    
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
//        setPageView()
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
    
//    private func setPageView(){
//        pageViewController.delegate = self
//        pageViewController.dataSource = self
//    }
    
}

//extension WannaKnowViewController:PageViewControllerDelegate,PageViewControllerDataSource{
//    func pageViewController(_ pageViewController: PageViewController, willStartScrollingFrom startingViewController: UIViewController, destinationViewController: UIViewController) {
//        <#code#>
//    }
//
//    func pageViewController(_ pageViewController: PageViewController, isScrollingFrom startingViewController: UIViewController, destinationViewController: UIViewController?, progress: CGFloat) {
//        <#code#>
//    }
//
//    func pageViewController(_ pageViewController: PageViewController, didFinishScrollingFrom startingViewController: UIViewController, destinationViewController: UIViewController, transitionSuccessful: Bool) {
//        <#code#>
//    }
//
//    func pageViewController(_ pageViewController: PageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
//        <#code#>
//    }
//
//    func pageViewController(_ pageViewController: PageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
//        <#code#>
//    }
//}
