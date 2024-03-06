import SwiftUI

struct WeekDayDateView: View {
    var weekDay: String
    var isCurrentDay: Bool = false
    
    var body: some View {
        Text(weekDay).offset(y:12).foregroundStyle(isCurrentDay ? Color.black : Color.textPrimary).fontWeight(.semibold)
    }
}
