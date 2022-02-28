//
//  ChiaoWanViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/21.
//

import UIKit
import SnapKit

class ChiaoWanViewController: UIViewController{
    
    //MARK:-Properties
    var chiaoWanArray:[HomePageData] = [
        HomePageData(title: "三小嘟三小", count: 3, date: "2021-02-13")
    ]
    
    let chiaoWanView = ChiaoWanView()
    
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = chiaoWanView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setTextField()
    }
    
    private func setTableView(){
        chiaoWanView.tableView.delegate = self
        chiaoWanView.tableView.dataSource = self
    }
    
    private func setTextField(){
        chiaoWanView.textField.delegate = self
    }
}

extension ChiaoWanViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chiaoWanArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:PageViewControllerCell.reuseIdentifier, for: indexPath) as! PageViewControllerCell
        cell.configuration(data: chiaoWanArray[indexPath.row])
        return cell
    }
}

extension ChiaoWanViewController:UITextFieldDelegate{

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("1")
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= view.frame.height * 0.5
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("2")
        textField.resignFirstResponder()
        if self.view.frame.origin.y < 0{
            self.view.frame.origin.y = 0
        }
        return true
    }
    
}
