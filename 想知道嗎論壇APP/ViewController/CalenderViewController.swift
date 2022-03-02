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
    
    //MARK:-LifeCycle
    override func loadView() {
        view = calendarView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setCalender()
        setTableView()
        setGesture()
        
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
    
    private func configureCell(view:JTACDayCell?, cellState: CellState) {
        guard let cell = view as? CalenderCell else { return }
        cell.dateLabel.text = cellState.text
        handleCellTextColor(cell: cell, cellState: cellState)
        handleCellSelected(cell: cell, cellState: cellState)
    }
    
    private func handleCellTextColor(cell: CalenderCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            cell.dateLabel.textColor = UIColor.black
        } else {
            cell.dateLabel.textColor = UIColor.gray
        }
    }
    
    private func handleCellSelected(cell:CalenderCell,cellState: CellState){
        cell.selectedView.isHidden = !cellState.isSelected
        switch cellState.selectedPosition() {
        case .left:
            cell.selectedView.layer.cornerRadius = 20
            cell.selectedView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMinXMinYCorner]
        case .middle:
            cell.selectedView.layer.cornerRadius = 0
            cell.selectedView.layer.maskedCorners = []
        case .right:
            cell.selectedView.layer.cornerRadius = 20
            cell.selectedView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
        case .full:
            cell.selectedView.layer.cornerRadius = 20
            cell.selectedView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
        default: break
        }
    }
    
    private func setGesture(){
        let panGensture = UILongPressGestureRecognizer(target: self, action: #selector(didStartRangeSelecting))
        panGensture.minimumPressDuration = 0.5
        calendarView.calendar.addGestureRecognizer(panGensture)
    }
    
    @objc func didStartRangeSelecting(gesture:UILongPressGestureRecognizer){
        let point = gesture.location(in: gesture.view!)
        let rangeSelectDate = calendarView.calendar.selectedDates
        guard let cellState = calendarView.calendar.cellStatus(at: point) else { return }
        
        if !rangeSelectDate.contains(cellState.date){
            let dateRange = calendarView.calendar.generateDateRange(from: rangeSelectDate.first ?? cellState.date, to: cellState.date)
            calendarView.calendar.selectDates(dateRange, keepSelectionIfMultiSelectionAllowed: true)
        }else{
            let followingDate = testCalendar.date(byAdding: .day, value: 1, to: cellState.date)!
            calendarView.calendar.selectDates(from: followingDate, to: rangeSelectDate.last!, triggerSelectionDelegate: true, keepSelectionIfMultiSelectionAllowed: false)
        }
    }
}
//MARK:-setCalenderDelegate
extension CalenderViewController:JTACMonthViewDelegate,JTACMonthViewDataSource{
    func calendar(_ calendar: JTACMonthView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTACMonthReusableView {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: CalenderHeader.reuseIdentifier, for: indexPath) as! CalenderHeader
        header.monthTitle.text = formatter.string(from: range.start)
        return header
    }
    
    func calendarSizeForMonths(_ calendar: JTACMonthView?) -> MonthSize? {
        return MonthSize(defaultSize: 60)
    }
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableCell(withReuseIdentifier: CalenderCell.reuseIdentifier, for: indexPath) as! CalenderCell
        
        cell.dateLabel.text = cellState.text
        
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        
        if cellState.dateBelongsTo == .thisMonth{
            cell.dateLabel.textColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
        }else{
            cell.dateLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        return cell
    }
    
    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        
    }

    
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = Date()
        return ConfigurationParameters(startDate: startDate, endDate: endDate)
    }

    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let calenderCell = cell as! CalenderCell
        calenderCell.dateLabel.text = cellState.text
    }
}

//MARK:-setTableView
extension CalenderViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speechInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.reusebleIdentifier, for: indexPath) as! EventTableViewCell
        cell.configuration(calenderData: speechInfo[indexPath.row])
        return cell
    }
    
    
}
