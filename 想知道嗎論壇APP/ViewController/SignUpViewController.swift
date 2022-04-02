//
//  SignUpViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit

class SignUpViewController: UIViewController{
    
    let signUpView = SignUpView()
    
    let dataBase = SignUpDataBase()
    
    var store:WannaKnowData.Data = WannaKnowData.Data(wanna_know_id: "", category: "", title: "", description: "", speaker: "", date: "", year: "", live: "", tags: [String](), like: "", attachment: "", update_time: "", comment_amount: "")
    
    override func loadView() {
        super.loadView()
        view = signUpView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setDropDownListAction()
        setTextFieldDelegate()
        setTextFieldAndTextViewTags()
        setTagButtons()
    }
    
    private func setTextFieldDelegate(){
        signUpView.speechPersonColumn.textField.delegate = self
        signUpView.themeColumn.textField.delegate = self
        signUpView.linkInfo.textField.delegate = self
        signUpView.tags.textField.delegate = self
        signUpView.textView.delegate = self
    }
    
    private func setTagButtons(){
        signUpView.tagButtons.delegate = self
        signUpView.tagButtons.dataSource = self
    }
    
    private func setTextFieldAndTextViewTags(){
        signUpView.speechPersonColumn.textField.tag = 0
        signUpView.themeColumn.textField.tag = 1
        signUpView.linkInfo.textField.tag = 2
        signUpView.tags.textField.tag = 3
//        signUpView.textView.tag = 0
    }
    
    private func appendTextToTags(){
        dataBase.appendToStore(text: signUpView.tags.textField.text!)
        signUpView.tags.textField.text = ""
    }
    
    private func setSendButton(){
        signUpView.sendButton.addTarget(self, action: #selector(send), for: .touchDown)
    }
    
    @objc func send(){
        //append the data to dataBase Array
//        store = WannaKnowData.Data(wanna_know_id: <#T##String#>,
//                                   category: <#T##String#>,
//                                   title: signUpView.themeColumn.textField.text,
//                                   description: signUpView.textView.text,
//                                   speaker: signUpView.speechPersonColumn.textField.text,
//                                   date: <#T##String#>,
//                                   year: <#T##String#>,
//                                   live: <#T##String#>,
//                                   tags: dataBase.store,
//                                   like: <#T##String#>,
//                                   attachment: <#T##String#>,
//                                   update_time: <#T##String#>,
//                                   comment_amount: <#T##String#>)
//
        //then post the data to Back-End
        
    }
    
    private func tagBasedTextField(_ textField:UITextField){
        let newTextFieldTag = textField.tag + 1
        if let nextTextField = textField.superview?.viewWithTag(newTextFieldTag) as? UITextField{
            nextTextField.becomeFirstResponder()
            print("become")
        }else{
            textField.resignFirstResponder()
            print("resign")
        }
    }
    
    private func setDropDownListAction(){
        signUpView.kindChooser.kindPicker.addTarget(self, action: #selector(drop), for: .touchUpInside)
    }
    
    @objc func drop(sender: UIButton) {
        signUpView.kindChooser.dropDownList.dataSource = ["請選擇分類", "專案經驗", "學習小心得", "技術剖析", "職場工作", "生活頻道"]
        signUpView.kindChooser.dropDownList.anchorView = sender
        signUpView.kindChooser.dropDownList.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        signUpView.kindChooser.dropDownList.show()
        signUpView.kindChooser.dropDownList.selectionAction = { [weak self] (index: Int, item: String) in
            guard let _ = self else { return }
            sender.setTitle(item, for: .normal)
        }
    }
}


extension SignUpViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataBase.numberOfRowInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.reuseIdentifier, for: indexPath) as! TagCell
        tagCell.tagLabel.text = dataBase.cellForItemAt(index: indexPath)
        return tagCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataBase.removeAt(indexPath)
        collectionView.reloadData()
    }
}

extension SignUpViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tagBasedTextField(textField)
        print("現在的tag:",textField.tag)

        if textField.tag == 3{
            appendTextToTags()
            signUpView.tagButtons.reloadData()
        }
        
        return true
    }
}

extension SignUpViewController:UITextViewDelegate{
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
    }
}
