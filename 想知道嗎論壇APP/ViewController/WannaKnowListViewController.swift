//
//  WannaKnowListViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/6.
//

import UIKit

class WannaKnowListViewController: UIViewController{
    //MARK:-Properties
    
    let wannaAPIDataBase = WannaKnowDataBase()
    
    let wannaKnowDetailViewController = WannaKnowDetailViewController()
    
    let wannaKnowListView = WannaKnowListView()
    
    let tagButtons = TagButtons(collectionViewLayout: UICollectionViewFlowLayout())
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = wannaKnowListView
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        wannaAPIDataBase.valueChanged = {
            DispatchQueue.main.async {
                self.wannaKnowListView.tableView.reloadData()
            }
        }
        wannaAPIDataBase.onError = { error in
            print(error.localizedDescription)
        }
        
//        wannaAPIDataBase.loadDataByUpdateTime()
    }
    
    //MARK:-Method
    private func setTableView(){
        wannaKnowListView.tableView.delegate = self
        wannaKnowListView.tableView.dataSource = self
    }
    
}
extension WannaKnowListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wannaAPIDataBase.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:ContentCell.reuseIdentifier, for: indexPath) as! ContentCell
        cell.configuration(data: wannaAPIDataBase.getData(at: indexPath))
        cell.tagCollectionButtons.delegate = self
        cell.tagCollectionButtons.dataSource = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        wannaKnowDetailViewController.modalPresentationStyle = .formSheet
        present(wannaKnowDetailViewController, animated: true, completion: nil)
        wannaKnowDetailViewController.detail = wannaAPIDataBase.getData(at: indexPath)
        
    }
}

//MARK:-CollectionView set the delegate
extension WannaKnowListViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wannaAPIDataBase.numberOfRowsInCollectionViewSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.reuseIdentifier, for: indexPath) as! TagCell
        let names = wannaAPIDataBase.getCollectionTagData(at: indexPath)
        cell.button.setTitle(names.map{$0}.description, for: .normal)
        return cell
    }
}
