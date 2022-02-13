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
    
    let wannaKnowHeader = WannaKnowDetailHeader()
    
    var detailArray:[WannaKnowListData] = []{
        didSet{
            wannaKnowDetailView.tableView.reloadData()
        }
    }
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = wannaKnowDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        detailArray.removeAll()
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
        let chatArray = detailArray.map{$0.chatMessage.map{$0}![indexPath.row]}
        cell.configuration(data: chatArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: WannaKnowDetailHeader.reuseIdentifier) as! WannaKnowDetailHeader
        header.configuration(data: detailArray[section])
        return header
    }

}
