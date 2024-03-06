//
//  Calendar.swift
//  taskpro
//
//  Created by Gustavo Giordani on 04/03/24.
//

import Foundation
import SwiftUI

func verifyDate(weekDay: String) -> Bool {
    return weekDay == formattedCurrentDate()
}


func formattedCurrentDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd"
    let currentDate = Date()
    let formattedDate = dateFormatter.string(from: currentDate)
    
    return formattedDate
}

func weekDayFormatterText(weekDay:String) -> String {
    switch weekDay {
    case "Sunday":
        return "Dom"
    case "Monday":
        return "Seg"
    case "Tuesday":
        return "Ter"
    case "Wednesday":
        return "Qua"
    case "Thursday":
        return "Qui"
    case "Friday":
        return "Sex"
    case "Saturday":
        return "Sáb"
    default:
        return ""
    }
    
}

extension Date {
    func toString(_ format: String)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension Calendar  {
    var currentWeek: [DayModel]{
        guard let firstWeekDay = self.dateInterval(of: .weekOfMonth, for: Date())?.start else {
            return []}
        var week:[DayModel] = []
        for index in 0..<7{
            if let day = self.date(byAdding: .day, value:index,to: firstWeekDay){
                let dayString = day.toString("dd")
                var weekDaySymbol: String = day.toString("EEEE")
                _ = self.isDateInToday(day)
                weekDaySymbol = weekDayFormatterText(weekDay:weekDaySymbol)
                week.append(.init(id: UUID(), value: index,dayName: dayString, dayOfWeek: weekDaySymbol, tasks: []))
            }
  
          
        }
        return week
    }
}


