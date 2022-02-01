//
//  BulletinViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/21.
//

import UIKit



class BulletinTableViewController: UITableViewController {
    
    public var data:[HomePageData] = [HomePageData(title: "扮豬吃老虎", count:10, date: "2022-10-22"),
                               HomePageData(title: "狼若回頭，不是報恩，就是報仇", count: 20, date: "2022-11-23")]
    
    //MARK:-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    private func setTableView(){
        self.tableView.register(PageViewControllerCell.self, forCellReuseIdentifier: PageViewControllerCell.reuseIdentifier)
        self.tableView.backgroundColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
        self.tableView.register(Footer.self, forHeaderFooterViewReuseIdentifier: Footer.reuseIdentifier)
        self.tableView.rowHeight = 60
        self.tableView.allowsSelection = false
        self.tableView.separatorStyle = .singleLine
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:PageViewControllerCell.reuseIdentifier, for: indexPath) as! PageViewControllerCell
        cell.configuration(data: data[indexPath.row])
        return cell
    }
}
