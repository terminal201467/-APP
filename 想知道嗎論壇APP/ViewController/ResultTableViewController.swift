//
//  ResultTableViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/5.
//

import UIKit

class ResultTableViewController:UITableViewController {
    //MARK:-Properties

    var theme:String = ""
    
    var tag:String = ""
    
    private var searchDataBase:SearchDataBase!
    
    let detailController = WannaKnowDetailViewController()

    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchMethod()
        setTableView()
        setNavigationBar()
        print("result標籤：",theme)
        print("tag標籤：",tag)
    }
    
    func setNavigationBar(){
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        
        navigationItem.titleView = NavigationBarTitle()
        navigationItem.searchController?.searchBar.barTintColor = #colorLiteral(red: 0.3568245173, green: 0.3568896055, blue: 0.3568158746, alpha: 1)
        navigationItem.searchController?.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.searchController?.isActive = true
        
        let leftSideMenuButton = UIBarButtonItem(image: UIImage(named: "line.3.horizontal"),
                                                 style: .plain,
                                                 target:self,
                                                 action: #selector(sideMenuButtonMethod))
        
        let rightButton = UIBarButtonItem(image: UIImage(named: "magnifyingglass"), style: .plain, target: self, action: #selector(search))
        navigationItem.leftBarButtonItem = leftSideMenuButton
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
    }
    
    @objc func backToHomePage(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func sideMenuButtonMethod(){
        
    }
    
    @objc func search(){
        
    }

    //MARK:-Methods
    private func setTableView(){
        self.tableView.allowsSelection = true
        self.tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.reuseIdentifier)
    }
    
    private func setSearchMethod(){
        searchDataBase = SearchDataBase.init(searchBy: theme)
//        searchDataBase = SearchDataBase.init(searchByTag: tag)
        
        searchDataBase.valueChanged = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        searchDataBase.onError = { error in
            print(error.localizedDescription)
        }
        
        if theme == "" && tag == ""{
            searchDataBase.loadAllData()
            print("loadEveryThing")
        }else if theme != ""{
            searchDataBase.loadThemeData()
            print("loadTheme")
        }else if tag != ""{
            searchDataBase.loadTagData()
            print("loadTag")
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailController.detail = searchDataBase.getData(at: indexPath)
        present(detailController, animated: true)
    }
}

extension ResultTableViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text{
            searchDataBase.filterContent(for: searchText)
            tableView.reloadData()
        }
    }
}

