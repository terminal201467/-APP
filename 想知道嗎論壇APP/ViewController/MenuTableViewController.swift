//
//  MenuTableViewTableViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    //MARK:-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        view.backgroundColor = .systemGreen
    }
    
    private func setTableView(){
        self.tableView.register(HomePageSideMenuCell.self, forCellReuseIdentifier: HomePageSideMenuCell.reuseIdentifier)
        self.tableView.rowHeight = 50
        self.tableView.allowsSelection = true
        self.tableView.backgroundColor = .green
    }
    


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SideMenuName.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:HomePageSideMenuCell.reuseIdentifier, for: indexPath) as! HomePageSideMenuCell
        cell.logoMark.image = UIImage(named: SideMenuName.allCases[indexPath.row].logoName)
        cell.controllerName.text = SideMenuName.allCases[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sideMenuCases = SideMenuName.allCases[indexPath.row]
        
        
    }
}
