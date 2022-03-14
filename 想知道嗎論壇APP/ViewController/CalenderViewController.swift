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
    private let calendarView = CalenderView()
    
    let testCalendar = Calendar(identifier: .gregorian)
    
    var speechInfo:[CalenderData] = [CalenderData(recentDate: "Today", weekDate: "Tue", dateLabel: "Jan 19", speakerName: "號稱165的大叔", speechTitle:"如何買東西")]
    
    let calendarDataBase = CalendarDataBase()
    
    //MARK:-LifeCycle
    override func loadView() {
        view = calendarView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setCalender()
        setTableView()
        setDateChoose()
        
    }
    //MARK:-setCalender
    private func setCalender(){
        calendarView.calendar.calendarDelegate = self
        calendarView.calendar.calendarDataSource = self
    }
    
    private func setTableView(){
        calendarView.tableView.delegate = self
        calendarView.tableView.dataSource = self
    }
    
    //MARK:-setDateChooseButton
    private func setDateChoose(){
        calendarView.dateChooseButton.addTarget(self, action: #selector(chooseDate), for: .touchDown)
    }
    
    @objc func chooseDate(){
        let datePickerViewController = DatePickerModalViewController()
        datePickerViewController.modalPresentationStyle = .overCurrentContext
        datePickerViewController.modalTransitionStyle = .coverVertical
        self.present(datePickerViewController, animated: true)
    }

    //MARK:-點按日期被選擇後的事件
    private func handleCellSelection(cell:JTACDayCell,cellState: CellState){
        guard let customCell = cell as? CalenderCell else { return }
        if cellState.isSelected{
            customCell.selectedView.layer.cornerRadius = 15
            customCell.selectedView.layer.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            customCell.selectedView.isHidden = false
            calendarView.tableView.reloadData()
        }else{
            customCell.selectedView.isHidden = true
        }
    }
    
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = Date()
        let parameter = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 6, calendar: Calendar.current, generateInDates: .forAllMonths, generateOutDates: .tillEndOfGrid, firstDayOfWeek: .sunday, hasStrictBoundaries: true)
        return parameter
    }
    
    //MARK:-TimeTranslator
    
    func transCalendarYearHeader(_ year:Date)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: year)
    }
    
    func transCalendarCellTimeToString(_ Date:Date)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy HH:mm:ss Z"
        return formatter.string(from: Date)
    }
    
    
}
//MARK:-setCalenderDelegate
extension CalenderViewController:JTACMonthViewDelegate,JTACMonthViewDataSource{
    func calendar(_ calendar: JTACMonthView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTACMonthReusableView {
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: CalenderHeader.reuseIdentifier, for: indexPath) as! CalenderHeader
        header.monthTitle.text = transCalendarYearHeader(range.start)
        return header
    }
    
    func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
        return MonthSize(defaultSize: 60)
    }
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableCell(withReuseIdentifier: CalenderCell.reuseIdentifier, for: indexPath) as! CalenderCell
        cell.dateLabel.text = cellState.text
        if cellState.dateBelongsTo == .thisMonth{
            cell.dateLabel.textColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        }else{
            cell.dateLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        return cell
    }
    
    //MARK:-選擇一個日期時
    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        handleCellSelection(cell: cell!, cellState: cellState)
    }
    //MARK:-點掉一個日期時
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        handleCellSelection(cell: cell!, cellState: cellState)
    }

    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let customCell = cell as! CalenderCell
        customCell.dateLabel.text = cellState.text
        handleCellSelection(cell: cell, cellState:cellState)
    }
}

//MARK:-setTableView
extension CalenderViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendarDataBase.numberOfRowInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.reusebleIdentifier, for: indexPath) as! EventTableViewCell
        cell.configuration(data: calendarDataBase.getData(at: indexPath))
        return cell
    }
}
