//
//  DatePickerViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/3/14.
//

import UIKit

protocol DateDelegate:AnyObject {
    func dateDataReceive(date:Date)
}

class DatePickerViewController: UIViewController {
    //MARK:-Properties
    let datePickerView = DatePickerView()
    
    weak var delegate:DateDelegate!
    
    override func loadView() {
        super.loadView()
        view = datePickerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    private func setNavigationBar(){
        title = "選擇日期"
        let choose = UIBarButtonItem(title: "選擇", style: .plain, target: self, action: #selector(choose))
        let cancel = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = choose
        navigationItem.leftBarButtonItem = cancel
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
    }
    
    @objc func choose(){
        delegate.dateDataReceive(date: datePickerView.datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func cancel(){
        dismiss(animated: true, completion: nil)
    }
}
