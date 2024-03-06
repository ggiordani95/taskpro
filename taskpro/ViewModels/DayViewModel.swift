import SwiftUI

class DayViewModel: ObservableObject {
    @Published var days: [DayModel] = []
    @Published var currentDay: DayModel?

    init() {
       getItems()
    }
    
    func getItems() {
        let weekDays: [DayModel] = Calendar.current.currentWeek.map { weekDay in
            return DayModel(id: weekDay.id, value: weekDay.value, dayName: weekDay.dayName, dayOfWeek: weekDay.dayOfWeek, tasks: weekDay.tasks)
        }
        days.append(contentsOf: weekDays)
        if let currentDayData = days.first(where: { weekDay in
            return verifyDate(weekDay: weekDay.dayName)
        }) {
            print(currentDayData)
            self.currentDay = currentDayData
        } else {
            self.currentDay = days[2]
        }
    }
    
    func changeCurrentDay(day:DayModel){
        self.currentDay = day
    }

    func addingTaskToIndex(){
        let newItems = [
            TaskModel(id: UUID(), title: "Estudar Swift", isFinished: false),
            
        ]
        addingTasks(id: days[3].id, tasks: newItems)
        self.currentDay = days[3]
    }
    
    func addingTasks(id: UUID, tasks: [TaskModel]) {
        if let index = days.firstIndex(where: { $0.id == id }) {
             days[index].tasks.append(contentsOf: tasks)
             self.currentDay = days[index]
        }
    }
    
    func addTask(text: String){
        guard let currentDay = currentDay else { return }
        
        let newTask = TaskModel(id: UUID(), title: text, isFinished: false)
        
        if let index = days.firstIndex(where: { $0.id == currentDay.id }) {
            days[index].tasks.append(newTask)
            self.currentDay = days[index]
        }
            
    }
    
    func isDateEqual(dayName: String) -> Bool{
        return verifyDate(weekDay: dayName)
    }
    
    func toggleTasks(id: UUID, taskId: UUID) {
        if let index = days.firstIndex(where: { $0.id == id }) {
            if let taskIndex = days[index].tasks.firstIndex(where: { $0.id == taskId }) {
                days[index].tasks[taskIndex].isFinished.toggle()
                self.currentDay = days[index]
            }
        }
    }
    
    
    func removingTasks(id: UUID, taskId: UUID) {
        if let index = days.firstIndex(where: { $0.id == id }) {
            if let taskIndex = days[index].tasks.firstIndex(where: { $0.id == taskId }) {
                days[index].tasks.remove(at: taskIndex)
                self.currentDay = days[index]
            }
        }
    }
}
