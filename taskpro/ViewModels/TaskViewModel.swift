import SwiftUI
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
    private var cancellables: Set<AnyCancellable> = []
    var onTaskRemoved: ((UUID) -> Void)?
    weak var dayViewModel: DayViewModel?

    init(dayViewModel: DayViewModel) {
    
        self.dayViewModel = dayViewModel

        // Subscribe to changes in tasks
        $tasks
            .receive(on: DispatchQueue.main)
            .sink { [weak self] tasks in
                self?.dayViewModel?.currentDay?.tasks = tasks
            }
            .store(in: &cancellables)
    }

    
    
    func toggleItem(withID taskId: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == taskId }) {
            tasks[index].isFinished.toggle()
        }
    }

    func moveItem(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }

    func addTasks(_ tasks: [TaskModel]) {
        self.tasks.append(contentsOf: tasks)
    }

    func toggleTask(taskId: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == taskId }) {
            tasks[index].isFinished.toggle()
        }
    }

    func removeTask(taskId: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == taskId }) {
            tasks.remove(at: index)
        }
    }
    
}

