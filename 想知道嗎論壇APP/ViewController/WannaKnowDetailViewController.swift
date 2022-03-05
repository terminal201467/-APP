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
    
    var detail:WannaKnowData.Data?{
        didSet{
            wannaKnowDetailView.tableView.reloadData()
        }
    }
    
    var comments:[CommentsData] = [CommentsData(wanna_know_id: "222", messenger: "333", comment_id: "333", content: "333", like: "333", content_time: "333")]
//    let commentDataBase = CommentsDataBase(parameter: )
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = wannaKnowDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setTextField()
        notifiTheKeyboardWillShow()
        notifiTheKeyboardWillHide()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        detail = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setTableView(){
        wannaKnowDetailView.tableView.delegate = self
        wannaKnowDetailView.tableView.dataSource = self
    }
    
    private func setTextField(){
        wannaKnowDetailView.textField.delegate = self
    }
    
    //MARK:-KeyBoardShow
    func notifiTheKeyboardWillShow(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    //MARK:-KeyBoardHide
    func notifiTheKeyboardWillHide(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

extension WannaKnowDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WannaKnowDetailCell.reuseIdentifier, for: indexPath) as! WannaKnowDetailCell
        cell.configuration(data: comments[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: WannaKnowDetailHeader.reuseIdentifier) as! WannaKnowDetailHeader
        header.configuration(data: detail!)
        return header
    }
}

extension WannaKnowDetailViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
