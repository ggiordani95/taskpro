//
//  ContentView.swift
//
//
//  Created by Gustavo Giordani on 04/03/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @StateObject var dayViewModel: DayViewModel = DayViewModel()

    var body: some View {
        TaskScreen().environmentObject(dayViewModel)
    }
}


func createDraggableCircle() -> some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 8, height: 8)
            .foregroundColor(.gray.opacity(0.5))      
}

#Preview {
    ContentView()
}
