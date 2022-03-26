//
//  WannaKnowResultTableController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/25.
//

import UIKit

class WannaKnowResultTableController: UIViewController{
    
    let dataBase = SearchDataBase()
    
    let resultView = ResultTableView()
    
    let resultHeader = SearchResultHeader()
    
    let detailViewController = WannaKnowDetailViewController()
    
    override func loadView() {
        super.loadView()
        view = resultView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchData()
        setTableView()
        resultHeader.searchAllConfigure(result: dataBase.headerData())
    }
    
    private func setSearchData(){
        dataBase.valueChanged = {
            DispatchQueue.main.async {
                self.resultView.tableView.reloadData()
            }
        }
        
        dataBase.onError = { error in
            print(error.localizedDescription)
        }
        
        dataBase.loadAllData()
        
    }
    
    private func setTableView(){
        resultView.tableView.delegate = self
        resultView.tableView.dataSource = self
    }

}

extension WannaKnowResultTableController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataBase.numberOfRowInSection(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.reuseIdentifier, for: indexPath) as! ContentCell
        cell.configuration(data: dataBase.getData(at: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(detailViewController, animated: true, completion: nil)
        detailViewController.detail = dataBase.getData(at: indexPath)
    }
    
}

extension WannaKnowResultTableController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        print("搜尋：",searchController.searchBar.text!)
        dataBase.filterContent(for: searchController.searchBar.text!)
    }
}
