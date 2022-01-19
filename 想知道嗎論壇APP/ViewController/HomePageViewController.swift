//
//  ViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit
import SideMenu

class HomePageViewController: UIViewController {
    
    //MARK:-Properties
    let searchViewController = UISearchController(searchResultsController: nil)
    
    //MARK:-LifeCyCle
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSideMenu()
//        setNavigationBar()
//        setSearchController()
    }
    
    //MARK:-Methods
    private func setSideMenu(){
        SideMenuManager.PresentDirection.left
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: (self.navigationController?.view)!)
//        SideMenuManager.default.leftMenuNavigationController = MenuTableViewController
    }
    
    private func setNavigationBar(){
        let leftSideMenuButton = UIBarButtonItem(image: UIImage(named: "line.3.horizontal"),
                                                 style: .plain,
                                                 target:self,
                                                 action: #selector(sideMenuButtonMethod))
        
        self.navigationItem.leftBarButtonItem = leftSideMenuButton
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func sideMenuButtonMethod(){
        present(self, animated: true, completion: nil)
    }
    
    private func setSearchController(){
        self.navigationItem.searchController = searchViewController
    }
    
}

extension HomePageViewController:SideMenuNavigationControllerDelegate{
    
    
}

