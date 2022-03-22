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
    var chiaoWanData:[HomePageData] = [HomePageData(title: "三小嘟三小", count: 3, date: "2021-02-13")]{
        didSet{
            chiaoWanView.tableView.reloadData()
        }
    }
    
    private let chiaoWanView = ChiaoWanView()
    
    private let signUpViewController = SignUpViewController()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = chiaoWanView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setTextField()
        notifiTheKeyboardWillShow()
        notifiTheKeyboardWillHide()
        setSignInButton()
    }
    
    //MARK:-Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    private func setSignInButton(){
        chiaoWanView.signInButton.addTarget(self, action: #selector(signInButtonTouch), for: .touchDown)
        chiaoWanView.sendButton.addTarget(self, action: #selector(sendButtonTouch), for: .touchDown)
    }
    
    @objc func signInButtonTouch(){
        present(signUpViewController, animated: true, completion: nil)
        UIView.animate(withDuration: 0.1) {
            self.chiaoWanView.signInButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }completion: { finished in
            UIView.animate(withDuration: 0.1) {
                self.chiaoWanView.signInButton.transform = CGAffineTransform.identity
            }
        }
    }
    
    @objc func sendButtonTouch(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let now = formatter.string(from: Date())
        
        chiaoWanData.append(HomePageData(title: "\(chiaoWanView.textField.text!)", count: 4, date: now))
        
        UIView.animate(withDuration: 0.1) {
            self.chiaoWanView.sendButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }completion: { finished in
            UIView.animate(withDuration: 0.1) {
                self.chiaoWanView.sendButton.transform = CGAffineTransform.identity
            }
        }
        
        chiaoWanView.textField.text = ""
        view.endEditing(true)
        view.frame.origin.y = 0
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
        return chiaoWanData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:HomePageTableCell.reuseIdentifier, for: indexPath) as! HomePageTableCell
        cell.configuration(data: chiaoWanData[indexPath.row])
        return cell
    }
}

extension ChiaoWanViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
