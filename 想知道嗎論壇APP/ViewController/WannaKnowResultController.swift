//
//  WannaKnowListViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/6.
//

import UIKit

struct NotificationInfo{
    static let theme = ""
}

extension Notification.Name{
    static let deliverTheCategory = Notification.Name("Theme")
}

class WannaKnowResultController: UIViewController{
    //MARK:-Properties
    
    private let dataBase = WannaKnowDataBase()
    
    private let wannaKnowDetailViewController = WannaKnowDetailViewController()
    
    private let wannaKnowResultView = WannaKnowResultView()
    
    let tagButtons = TagButtons(collectionViewLayout: UICollectionViewFlowLayout())
    
    let signUpViewController = SignUpViewController()
    
    var theme:String = ""{
        didSet{ setDataBase() }
    }
    
    var tag:String = ""{
        didSet{
            print("標籤：",tag)
            dataBase.removeAll()
//            dataBase.loadTagData(by: tag)
            wannaKnowResultView.tableView.reloadData()
        }
    }
    
    var order:String = ""{
        didSet{
            setDataBase()
            print("排序：",order)
        }
    }
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = wannaKnowResultView
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setDataBase()
        setTableView()
        setSignInButton()
        receveThemeNotification()
        wannaKnowResultView.loadingMark.startAnimating()
        dataBase.loadAllData()
    }
    
    private func receveThemeNotification(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(receiveTheme(theme:)),
                                               name: .deliverTheCategory,
                                               object: nil)
    }
    
    @objc func receiveTheme(theme:Notification){
        if let userInfo = theme.userInfo,
           let message = userInfo[NotificationInfo.theme]{
            self.theme = message as! String
        }
    }
    
    //MARK:-Method
    func setDataBase(){
        dataBase.valueChanged = {
            DispatchQueue.main.async {
                self.wannaKnowResultView.tableView.reloadData()
                self.wannaKnowResultView.loadingMark.stopAnimating()
            }
        }
        dataBase.onError = { error in
            print(error.localizedDescription)
        }
        
        if theme == ""{
            dataBase.loadAllData()
            wannaKnowResultView.tableView.reloadData()
        }else{
            dataBase.removeAll()
            dataBase.loadCategoryData(by: theme, order: order)
            wannaKnowResultView.tableView.reloadData()
        }
    }
    
    private func setSignInButton(){
        wannaKnowResultView.signInButton.addTarget(self, action: #selector(choose), for:.touchDown)
    }
    
    private func setTableView(){
        wannaKnowResultView.tableView.delegate = self
        wannaKnowResultView.tableView.dataSource = self
    }
    
    @objc func choose(){
        present(signUpViewController, animated: true, completion: nil)
        UIView.animate(withDuration: 0.1) {
            self.wannaKnowResultView.signInButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }completion: { finished in
            UIView.animate(withDuration: 0.1) {
                self.wannaKnowResultView.signInButton.transform = CGAffineTransform.identity
            }
        }
    }
}
extension WannaKnowResultController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBase.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:ContentCell.reuseIdentifier, for: indexPath) as! ContentCell
        cell.configuration(data: dataBase.getData(at: indexPath))
        cell.tagCollectionButtons.delegate = self
        cell.tagCollectionButtons.dataSource = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        wannaKnowDetailViewController.modalPresentationStyle = .formSheet
        present(wannaKnowDetailViewController, animated: true, completion: nil)
        wannaKnowDetailViewController.detail = dataBase.getData(at: indexPath)
    }
}

//MARK:-CollectionView set the delegate
extension WannaKnowResultController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataBase.numberOfRowsInCollectionViewSection(section)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.reuseIdentifier, for: indexPath) as! TagCell
        let names = dataBase.getCollectionTagData(at: indexPath)
        if names == nil{
            cell.tagLabel.text = ""
        }else{
            cell.tagLabel.text = names
        }
        return cell
    }
}

extension WannaKnowResultController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        print("輸入框更新資料：",searchController.searchBar.searchTextField.text!)
        dataBase.filterContent(for: searchController.searchBar.searchTextField.text!)
        wannaKnowResultView.tableView.reloadData()
    }
}

extension WannaKnowResultController:ThemeDelegate{
    func receiveIndexParameter(index parameter: IndexPath) {
        print("")
    }
    
    func receiveThemeParameter(theme paramter: String) {
        if paramter == ""{
            self.theme = ""
        }else{
            self.theme = paramter
        }
    }
}

extension WannaKnowResultController:TagDelegate{
    func receiveTagDelegate(tag paramter: String) { tag = paramter }
}
