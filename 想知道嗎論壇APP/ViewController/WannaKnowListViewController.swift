//
//  WannaKnowListViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/6.
//

import UIKit

class WannaKnowListViewController: UIViewController {
    //MARK:-Properties
    
    var wannaKnowArray:[WannaKnowListData] = [
        WannaKnowListData(titleText: "扮豬吃老虎", personName: "MJ", date: "2022/02/30", content: "我最愛吃老虎，老虎最好吃，大家都以為熊掌最好吃，其實老虎的才是人間美味", buttonArray: ["技術剖析"], likeCount: "13", commentCount: "15"),
        WannaKnowListData(titleText: "狼若回頭，不是報恩就是報仇", personName: "大叔", date: "2022/02/30", content: "我就是內文blablablablablabla", buttonArray: ["技術剖析"], likeCount: "13", commentCount: "15")
    ]
    
    let wannaKnowListView = WannaKnowListView()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = wannaKnowListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    func setTableView(){
        wannaKnowListView.tableView.delegate = self
        wannaKnowListView.tableView.dataSource = self
    }
    
    //MARK:-Method
    
    
    
    

}
extension WannaKnowListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wannaKnowArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:ContentCell.reuseIdentifier, for: indexPath) as! ContentCell
        cell.configuration(data: wannaKnowArray[indexPath.row])
        return cell
    }
}
