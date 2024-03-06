import SwiftUI

struct TaskView: View {
    @EnvironmentObject var dayVM: DayViewModel
    
    var item: TaskModel
    var id: UUID
    @State private var currentDragOffset: CGFloat = 0
    var body: some View {
        HStack {
            VStack {
                if item.isFinished {
                    Button(action: {
                        if let currentDay = dayVM.currentDay {
                            withAnimation(.spring(duration: 0.3)){
                                dayVM.toggleTasks(id: currentDay.id, taskId: item.id)
                            }
                        } else { return }
                    }) {
                        Image("done")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color.customGreen)
                    }
                } else {
                    Button(action: {
                        if let currentDay = dayVM.currentDay {
                            withAnimation(.spring(duration: 0.3)){
                                dayVM.toggleTasks(id: currentDay.id, taskId: item.id)
                            }
                        } else { return }
                    
                    }) {
                        VStack {
                            Image(systemName: "circle")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 32))
                        }.frame(width: 32, height: 32)
                    }
                }
            }.padding(.horizontal, 6)
     
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.textPrimary)
            }.frame(height:60)

            // DragTaskView()

        }
        
        .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
        .padding()
        .background(Color.bgContent)
        .cornerRadius(18)
        .shadow(radius: 1)
        .padding(.leading, 6)
        .offset(x: currentDragOffset)
        .gesture(
                    DragGesture().onChanged { value in
                        withAnimation(.spring(duration:0.2)) {
                            currentDragOffset = value.translation.width
                     
                        }
                    }.onEnded { value in
                            currentDragOffset = 0
                            let threshold = CGFloat(-160)
                            if value.translation.width <= threshold {
                                withAnimation(.spring) {
                                    if let currentDay = dayVM.currentDay {
                                        dayVM.removingTasks(id: currentDay.id, taskId: item.id)
                                    } else { return }
                                }
                            }
                    }
                )
        
    }
  
    
}
