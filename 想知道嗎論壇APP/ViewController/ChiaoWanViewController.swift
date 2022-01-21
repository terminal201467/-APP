//
//  ChiaoWanViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/21.
//

import UIKit

class ChiaoWanViewController: UIViewController {
    
    let chiaoWanView = ChiaoWanView()
    
    //MARK:-LifeCycle
    override func loadView() {
        super.loadView()
        view = chiaoWanView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()

    }
    
    private func setTableView(){
        chiaoWanView.tableView.delegate = self
        chiaoWanView.tableView.dataSource = self
    }

}

extension ChiaoWanViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}
