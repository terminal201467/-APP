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
    var chiaoWanArray:[HomePageData] = [HomePageData(title: "扮豬吃老虎", count:10, date: "2022-10-22"),
                                        HomePageData(title: "狼若回頭，不是報恩，就是報仇", count: 20, date: "2022-11-23")]
    
    let chiaoWanView = ChiaoWanView()
    
    let editingViewController = EditingTextFieldViewController()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = chiaoWanView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setChildView()
        setTextField()
    }
    
    private func setTableView(){
        chiaoWanView.tableView.delegate = self
        chiaoWanView.tableView.dataSource = self
    }
    
    private func setTextField(){
        editingViewController.editingTextFieldView.textField.delegate = self
    }
    private func setChildView(){
        add(editingViewController)
        editingViewController.view.snp.makeConstraints { make in
            make.right.left.top.bottom.equalTo(chiaoWanView.editingTextFieldContainerView)
        }
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
