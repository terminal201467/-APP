//
//  ResultTableViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/5.
//

import UIKit

class ResultTableViewController:UITableViewController {
    
    //MARK:-Properties

    var tag:String = ""
    
    var searchDataBase:SearchDataBase!

    //MARK:-LifeCycle
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTag()
        setTableView()
        print("resultViewController Loaded!")
    }
    
    //MARK:-Methods
    private func setTableView(){
        self.tableView.allowsSelection = true
        self.tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.reuseIdentifier)
    }
    
    private func setTag(){
        searchDataBase = SearchDataBase.init(searchBy: tag)
        searchDataBase.valueChanged = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        searchDataBase.onError = { error in
            print(error.localizedDescription)
        }
        if tag == ""{
            searchDataBase.loadAllData()
        }else{
            searchDataBase.loadTagData()
        }
    }
    


    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchDataBase.numberOfRowInSection(at: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.reuseIdentifier, for: indexPath) as! ContentCell
        cell.configuration(data: searchDataBase.getData(at: indexPath))
        return cell
    }
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return SearchResultHeader()
//    }
}

extension ResultTableViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text{
            searchDataBase.filterContent(for: searchText)
            tableView.reloadData()
        }
    }
}
