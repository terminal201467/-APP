//
//  WannaKnowListViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/6.
//

import UIKit


class WannaKnowListViewController: UIViewController{
    //MARK:-Properties
    
    private let dataBase = WannaKnowDataBase()
    
    private let wannaKnowDetailViewController = WannaKnowDetailViewController()
    
    private let wannaKnowListView = WannaKnowListView()
    
    let tagButtons = TagButtons(collectionViewLayout: UICollectionViewFlowLayout())
    
    let signUpViewController = SignUpViewController()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = wannaKnowListView
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setSignInButton()
        dataBase.valueChanged = {
            DispatchQueue.main.async {
                self.wannaKnowListView.tableView.reloadData()
            }
        }
        dataBase.onError = { error in
            print(error.localizedDescription)
        }
        
        dataBase.loadData()
    }
    
    //MARK:-Method
    private func setTableView(){
        wannaKnowListView.tableView.delegate = self
        wannaKnowListView.tableView.dataSource = self
    }
    
    private func setSignInButton(){
        wannaKnowListView.signInButton.addTarget(self, action: #selector(choose), for:.touchDown)
    }
    
    @objc func choose(){
        present(signUpViewController, animated: true, completion: nil)
        UIView.animate(withDuration: 0.1) {
            self.wannaKnowListView.signInButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }completion: { finished in
            UIView.animate(withDuration: 0.1) {
                self.wannaKnowListView.signInButton.transform = CGAffineTransform.identity
            }
        }
    }
}
extension WannaKnowListViewController:UITableViewDelegate,UITableViewDataSource{
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
extension WannaKnowListViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataBase.numberOfRowsInCollectionViewSection(section)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.reuseIdentifier, for: indexPath) as! TagCell
        let names = dataBase.getCollectionTagData(at: indexPath)
        if names.count == 0{
            cell.tagLabel.text = ""
        }else{
            cell.tagLabel.text = names[indexPath.row]
        }
        return cell
    }
}
