//
//  WannaKnowViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit
import SideMenu

class WannaKnowViewController: UIViewController {
    
    //MARK:-Properties
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuTableViewController())
    
    private let wannaKnowView = WannaKnowView()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = wannaKnowView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setSegmented()
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
    
    private func setSegmented(){
        wannaKnowView.segmentedControl.addTarget(self, action: #selector(changePage), for: .touchDown)
    }
    
    @objc func changePage(){
        
    }
    
}


