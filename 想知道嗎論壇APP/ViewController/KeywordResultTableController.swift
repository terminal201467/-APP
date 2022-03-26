//
//  ResultTableViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/5.
//

import UIKit

class KeywordResultTableController:UIViewController {
    
    let dataBase = SearchDataBase()
    //MARK:-Properties
    var keyword:String = ""{
        didSet{
            self.resultTableView.tableView.reloadData()
            dataBase.loadKeywordData(by: keyword)
            resultTableView.resultHeader.searchKeywordConfigure(result: dataBase.headerData(), keyword: keyword)
        }
    }
    
    let detailController = WannaKnowDetailViewController()
    
    private let resultTableView = ResultTableView()

    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = resultTableView
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setSearchMethod()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    private func setNavigationBar(){
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
        resultTableView.tableView.delegate = self
        resultTableView.tableView.dataSource = self
    }
    
    private func setSearchMethod(){
        dataBase.valueChanged = {
            DispatchQueue.main.async {
                self.resultTableView.tableView.reloadData()
            }
        }
        dataBase.onError = { error in
            print(error.localizedDescription)
        }
    }
}
    
// MARK: - Table view data source
extension KeywordResultTableController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBase.numberOfRowInSection(at: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.reuseIdentifier, for: indexPath) as! ContentCell
        cell.configuration(data: dataBase.getData(at: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailController.detail = dataBase.getData(at: indexPath)
        present(detailController, animated: true)
    }
}

extension KeywordResultTableController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text{
            dataBase.filterContent(for: searchText)
            resultTableView.tableView.reloadData()
        }
    }
}

