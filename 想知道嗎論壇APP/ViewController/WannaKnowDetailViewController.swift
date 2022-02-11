//
//  WannaKnowDetailViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/10.
//

import UIKit

class WannaKnowDetailViewController: UIViewController {
    
    //MARK:-Properties
    let wannaKnowDetailView = WannaKnowDetailView()
    
    var detailArray:[WannaKnowListData] = []
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = wannaKnowDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    private func setTableView(){
        wannaKnowDetailView.tableView.delegate = self
        wannaKnowDetailView.tableView.dataSource = self
    }
}

extension WannaKnowDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        detailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WannaKnowDetailCell.reuseIdentifier, for: indexPath) as! WannaKnowDetailCell
        
        return cell
    }
    
    
    
}
