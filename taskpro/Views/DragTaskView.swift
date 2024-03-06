
import SwiftUI

struct DragTaskView: View {
    @State private var dragAmount = CGSize.zero

        var body: some View {
            VStack {
                HStack {
                    createDraggableCircle()
                    createDraggableCircle()
                }
                HStack {
                    createDraggableCircle()
                    createDraggableCircle()
                }
            }.frame(maxWidth: .infinity, alignment: .trailing)
          
        }
}
