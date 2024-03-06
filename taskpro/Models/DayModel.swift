import Foundation
import SwiftUI

struct DayModel: Identifiable {
    var id: UUID
    var value: Int
    var dayName: String
    var dayOfWeek: String
    var tasks: [TaskModel]
}
