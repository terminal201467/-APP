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
        view.backgroundColor = #colorLiteral(red: 0.4875313044, green: 0.8161220551, blue: 0.6423928142, alpha: 1)
    }
    
    
    
    private func setTableView(){
        self.tableView.register(SideMenuCell.self, forCellReuseIdentifier: SideMenuCell.reuseIdentifier)
        self.tableView.rowHeight = 70
        self.tableView.allowsSelection = true
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideMenuName.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:SideMenuCell.reuseIdentifier, for: indexPath) as! SideMenuCell
        cell.logoMark.image = UIImage(named: SideMenuName.allCases[indexPath.row].logoName)
        cell.controllerName.text = SideMenuName.allCases[indexPath.row].title
        let greenView = UIView()
        greenView.backgroundColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        cell.selectedBackgroundView = greenView
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("點選：\(indexPath.row)")
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        let sideMenuCases = SideMenuName.allCases[indexPath.row]
        switch sideMenuCases {
        case .xiangZhiDaoMa:
            print("想知道嗎？")
            let wannaKnowVC = WannaKnowViewController()
            present(wannaKnowVC, animated: true, completion: nil)
        }
        
    }
}
