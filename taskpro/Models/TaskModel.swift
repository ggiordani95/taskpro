import Foundation
import SwiftUI

struct TaskModel: Identifiable {
    let id: UUID
    let title: String
    var isFinished: Bool
}
