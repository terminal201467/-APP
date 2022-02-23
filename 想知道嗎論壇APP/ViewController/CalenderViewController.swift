//
//  CalenderViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit
import JTAppleCalendar

class CalenderViewController: UIViewController {
    //MARK:-Properties
    
    private let calenderView = CalenderView()
    
    //MARK:-LifeCycle
    override func loadView() {
        view = calenderView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        setCalender()
        // Do any additional setup after loading the view.
    }
    
    //MARK:-setCalender
//    private func setCalender(){
//        calenderView.calendarView.calendarDelegate = self
//        calenderView.calendarView.calendarDataSource = self
//    }
    
//    func handleCellSelection(view:JTAppleCellView?, cellState:CellState){
//        guard let cell = view as? CalenderCell  else { return }
//
//
//
//    }
}


//extension CalenderViewController:JTACMonthViewDelegate,JTACMonthViewDataSource{
//
//    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
//        let cell = calendar.dequeueReusableCell(withReuseIdentifier: CalenderCell.reuseIdentifier, for: indexPath) as! CalenderCell
//
//        cell.dayLabel.text = cellState.text
//        if cellState.dateBelongsTo == .thisMonth{
//            cell.dayLabel.textColor = #colorLiteral(red: 0.4743221402, green: 0.7362652421, blue: 0.5361232162, alpha: 1)
//        }else{
//            cell.dayLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        }
//    }
    
//    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
//        <#code#>
//    }
//
//    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
//        let calenderCell = cell as! CalenderCell
//
//
//
//    }
//}
