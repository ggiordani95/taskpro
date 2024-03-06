import SwiftUI

struct DayLabel: View {
    var onClick: () -> Void
    var weekDayName: String
    var weekDayOfWeek: String
    @EnvironmentObject var dayVM: DayViewModel
    
    var body: some View {
        Button(action:{onClick()}, label: {
            ZStack{
                Rectangle().fill(dayVM.currentDay?.dayName == weekDayName ? Color.customGreen : Color.clear).frame(width: 72)
                WeekDayDateView(weekDay: weekDayOfWeek, isCurrentDay: dayVM.currentDay?.dayName == weekDayName)
                WeekDayTextView(weekDayText: weekDayName, isCurrentDay: dayVM.currentDay?.dayName == weekDayName)
            }.frame(maxHeight:80).cornerRadius(20).frame(alignment: .topLeading).foregroundStyle(verifyDate(weekDay:weekDayName) ? Color.black : Color.textPrimary.opacity(0.7))
        })
    }
}
