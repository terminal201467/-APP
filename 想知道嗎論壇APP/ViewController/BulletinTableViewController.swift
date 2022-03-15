//
//  BulletinViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/21.
//

import UIKit



class BulletinViewController: UIViewController {
    
    var data:[HomePageData] = [HomePageData(title: "狼若回頭", count: 2, date: "2022-01-11")]
    
    let bulletinView = BulletinView()
    
    //MARK:-LifeCycle
    
    override func loadView() {
        super.loadView()
        view = bulletinView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setSignInButton()
    }
    
    private func setTableView(){
        bulletinView.tableView.delegate = self
        bulletinView.tableView.dataSource = self
    }
    
    private func setSignInButton(){
        bulletinView.signInButton.addTarget(self, action: #selector(touch), for: .touchDown)
    }
    
    @objc func touch(){
        UIView.animate(withDuration: 0.4) {
            self.bulletinView.signInButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }completion: { finished in
            UIView.animate(withDuration: 0.4) {
                self.bulletinView.signInButton.transform = CGAffineTransform.identity
            }
        }
    }
}

// MARK: - Table view data source
extension BulletinViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:PageViewControllerCell.reuseIdentifier, for: indexPath) as! PageViewControllerCell
        cell.configuration(data: data[indexPath.row])
        return cell
    }
        
}



