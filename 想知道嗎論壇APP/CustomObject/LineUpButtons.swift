////
////  LineUpButtonsTableViewController.swift
////  想知道嗎論壇APP
////
////  Created by Jhen Mu on 2022/2/18.
////
//
//import UIKit
//
//class LineUpButtons: UITableViewController {
//
//    //MARK:-Properties
//    var buttonsName:[String] = []
//
//    var seperateButtonName:[[String]]{
//        var splitCase:[[String]] = []
//        if buttonsName.map({$0.count})[ItemRanges.untilfirst.range].reduce(0, +) > 30 {
//            splitCase = buttonsName.twoThreeSplit()
//        }else if buttonsName.map({$0.count})[ItemRanges.untilSecond.range].reduce(0, +) > 30{
//            splitCase = buttonsName.threeTwoSplit()
//        }else if buttonsName.map({$0.count})[ItemRanges.untilThird.range].reduce(0, +) > 30{
//            splitCase = buttonsName.fourOneSplit()
//        }
//        return splitCase
//    }
//
//    //MARK:-LifeCycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setTableView()
//    }
//
//    //MARK:-setTableView
//    func setTableView(){
//        tableView.register(LineUpButtonsCell.self, forCellReuseIdentifier: LineUpButtonsCell.reuseIdentifier)
//        tableView.allowsSelection = false
//        tableView.separatorStyle = .none
//        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        tableView.rowHeight = 150
//    }
//
//    // MARK: - Table view data source
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return buttonsName.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: LineUpButtonsCell.reuseIdentifier, for: indexPath) as! LineUpButtonsCell
//
//        //分成兩個Array的情形
//        if buttonsName.map({$0.count})[ItemRanges.untilSecond.range].reduce(0, +) > 30{
//            cell.buttonsName =
//        //只有一個Array的情形
//        }else{
//
//        }
//
//
//
//        //如果否，條件是：
//
//        //如果是，條件是：
//
//
//        //如果有沒有要分隔，會變成一欄
//
//        //如果有要分隔，會變成兩欄
//
//
//
//        return cell
//    }
//
//}
