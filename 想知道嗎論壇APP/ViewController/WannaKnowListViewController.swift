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
        WannaKnowListData(titleText: "Title", personName: "MJ", date: "2022-02-30", content: "BlablablablablaBlaBla", buttonArray: ["技術剖析"], likeCount: "13", commentCount: "15",chatMessage: [WannaKnowListData.ChatMessage(commentPerson: "阿傑", commentStair: 1, commentMessage: "Pupupupupupupupupupupupupupup", commentDate: "2022-11-01", likeCount: 999),WannaKnowListData.ChatMessage(commentPerson: "阿傑", commentStair: 2, commentMessage: "很順嘛", commentDate: "2022-11-01", likeCount: 2)]),
        WannaKnowListData(titleText: "狼若回頭，不是報恩就是報仇", personName: "大叔", date: "2022/02/30", content: "我就是內文blablablablablabla", buttonArray: ["技術剖析"], likeCount: "13", commentCount: "15")
    ]
    
    let wannaKnowDetailVC = WannaKnowDetailViewController()
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        wannaKnowDetailVC.modalPresentationStyle = .formSheet
        present(wannaKnowDetailVC, animated: true, completion: nil)
        wannaKnowDetailVC.detailArray.append(wannaKnowArray[indexPath.row])
    }
}
