//
//  WannaKnowDetailViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/10.
//

import UIKit

class WannaKnowDetailViewController: UIViewController {
    
    //MARK:-Properties
    private let wannaKnowDetailView = WannaKnowDetailView()
    
    private let wannaKnowHeader = WannaKnowDetailHeader()
     
    private let commentsDataBase = CommentsDataBase()
    
    public var detail:WannaKnowData.Data?{
        didSet{
            wannaKnowDetailView.tableView.reloadData()
            setDataBase()
//            print("細節：",detail!.wanna_know_id)
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
        setTextField()
        notifiTheKeyboardWillShow()
        notifiTheKeyboardWillHide()
        setSendButton()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
//        detail = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setDataBase(){
        commentsDataBase.valueChange = {
            DispatchQueue.main.async {
                self.wannaKnowDetailView.tableView.reloadData()
            }
        }
        
        commentsDataBase.onError = { error in
            print(error.localizedDescription)
        }
        commentsDataBase.loadData(byID:detail!.wanna_know_id)
    }
    
    private func setTableView(){
        wannaKnowDetailView.tableView.delegate = self
        wannaKnowDetailView.tableView.dataSource = self
    }
    
    private func setTextField(){
        wannaKnowDetailView.textField.delegate = self
    }

    private func setSendButton(){
        wannaKnowDetailView.sendButton.addTarget(self, action: #selector(send), for: .touchDown)
    }
    
    @objc func send(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let now = formatter.string(from: Date())
        //Post the Data
        
        commentsDataBase.postComments(byID: detail!.wanna_know_id, comments: wannaKnowDetailView.textField.text!)
        
        commentsDataBase.removeAll()
        
        commentsDataBase.loadData(byID: detail!.wanna_know_id)
        
        wannaKnowDetailView.tableView.reloadData()
        
        UIView.animate(withDuration: 0.1) {
            self.wannaKnowDetailView.sendButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { finished in
            self.wannaKnowDetailView.sendButton.transform = CGAffineTransform.identity
        }
        view.endEditing(true)
        view.frame.origin.y = 0
        wannaKnowDetailView.textField.text = ""
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
        commentsDataBase.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WannaKnowDetailCell.reuseIdentifier, for: indexPath) as! WannaKnowDetailCell
        cell.configuration(data: commentsDataBase.getData(indexPath))
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
