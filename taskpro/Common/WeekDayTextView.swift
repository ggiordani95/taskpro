import SwiftUI

struct WeekDayTextView: View {
    var weekDayText: String
    var isCurrentDay: Bool = false
    
    var body: some View {
        Text(weekDayText).offset(y:-12).fontWeight(.semibold).foregroundStyle(isCurrentDay ? Color.black : Color.textPrimary)
    }
}
