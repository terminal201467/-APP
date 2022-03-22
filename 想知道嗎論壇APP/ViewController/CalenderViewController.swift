//
//  CalenderViewController.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/1/19.
//

import UIKit
import JTAppleCalendar

class CalenderViewController: UIViewController{
    //MARK:-Properties
    private let calendarView = CalenderView()
    
    private let testCalendar = Calendar(identifier: .gregorian)
    
    var speechInfo:[CalenderData] = [CalenderData(recentDate: "Today", weekDate: "Tue", dateLabel: "Jan 19", speakerName: "號稱165的大叔", speechTitle:"如何買東西")]
    
    private let calendarDataBase = CalendarDataBase()
    
    private var choosenDate = Date()
    
    //MARK:-LifeCycle
    override func loadView() {
        view = calendarView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setCalender()
        setTableView()
        setDateChoose()
        setSignInButton()
        calendarDataBase.valueChanged = {
            DispatchQueue.main.async {
                self.calendarView.calendar.reloadData()
            }
        }
        
        calendarDataBase.onError = { error in
            print(error)
        }
        calendarDataBase.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        calendarView.calendar.scrollToDate(Date())
    }
    //MARK:-setCalender
    private func setCalender(){
        calendarView.calendar.calendarDelegate = self
        calendarView.calendar.calendarDataSource = self
    }
    
    private func setSignInButton(){
        calendarView.signInButton.addTarget(self, action: #selector(choose), for: .touchDown)
    }
    
    @objc func choose(){
        UIView.animate(withDuration: 0.1) {
            self.calendarView.signInButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }completion: { finished in
            UIView.animate(withDuration: 0.1) {
                self.calendarView.signInButton.transform = CGAffineTransform.identity
            }
        }
    }
    
    //MARK:-setTableView
    private func setTableView(){
        calendarView.tableView.delegate = self
        calendarView.tableView.dataSource = self
    }
    
    //MARK:-setDateChooseButton
    private func setDateChoose(){
        calendarView.dateChooseButton.addTarget(self, action: #selector(chooseDate), for: .touchDown)
    }
    
    @objc func chooseDate(){
        UIView.animate(withDuration: 0.1) {
            self.calendarView.dateChooseButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }completion: { finished in
            UIView.animate(withDuration: 0.1) {
                self.calendarView.dateChooseButton.transform = CGAffineTransform.identity
            }
        }
        let modalPresentController = ModalPresentViewController()
        modalPresentController.datePickerController.delegate = self
        modalPresentController.modalPresentationStyle = .overCurrentContext
        modalPresentController.modalTransitionStyle = .coverVertical
        self.present(modalPresentController, animated: true)
    }

    //MARK:-點按日期被選擇後的事件
    private func handleCellSelection(cell:JTACDayCell,cellState: CellState){
        guard let customCell = cell as? CalenderCell else { return }
        if cellState.isSelected{
            let selectDateString = calendarDataBase.dateTranslate.string(from: cellState.date)
            customCell.selectedView.layer.cornerRadius = 15
            customCell.selectedView.layer.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            customCell.selectedView.isHidden = false
            calendarDataBase.filterDate(for: selectDateString)
        }else{
            customCell.selectedView.isHidden = true
            calendarDataBase.removeAllData()
        }
        calendarView.tableView.reloadData()
    }
    
    //MARK:-showTheEvent
    private func showTheEventCell(cell:JTACDayCell,cellState:CellState){
        guard let customCell = cell as? CalenderCell else { return }
        let date = calendarDataBase.dateTranslate.string(from: cellState.date)
        let events = calendarDataBase.showAllEvent().map{calendarDataBase.dateTranslate.string(from: $0)}
        if events.contains(date){
            customCell.eventBar.isHidden = false
            customCell.eventBar.layer.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }else{
            customCell.eventBar.isHidden = true
        }
    }
    
    private func showToDayCell(cell:JTACDayCell,cellState:CellState){
        guard let customCell = cell as? CalenderCell else { return }
        let calendarDate = calendarDataBase.dateTranslate.string(from: cellState.date)
        let toDay = calendarDataBase.dateTranslate.string(from: Date())
        if calendarDate.contains(toDay){
            customCell.todayView.isHidden = false
            customCell.todayView.layer.backgroundColor = #colorLiteral(red: 0.4011802375, green: 0.6375043988, blue: 0.4550539255, alpha: 1)
            customCell.dateLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            customCell.todayView.layer.cornerRadius = 18
            
        }else{
            customCell.todayView.isHidden = true
        }
    }
    
    //MARK:-TimeTranslator
    private func transCalendarYearHeader(_ year:Date)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: year)
    }
    
    private func transCalendarCellTimeToString(_ Date:Date)->String{
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
    
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = Date()
        let parameter = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: 6, calendar: Calendar.current, generateInDates: .forAllMonths, generateOutDates: .tillEndOfGrid, firstDayOfWeek: .sunday, hasStrictBoundaries: true)
        return parameter
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
        showToDayCell(cell: cell, cellState: cellState)
        showTheEventCell(cell: cell, cellState: cellState)
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

//MARK:-Delegate Pass the Date back
extension CalenderViewController:DateDelegate{
    func dateDataReceive(date: Date) {
        choosenDate = date
        calendarView.calendar.scrollToDate(date)
        calendarView.calendar.reloadData()
    }
}
