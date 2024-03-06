
import SwiftUI

struct TaskScreen: View {
    @EnvironmentObject var viewModel: DayViewModel
    @State private var isFullScreenPresented = false
    
    var body: some View {
        VStack{
            HeaderDashboard()
           
            ScrollDayOfWeek()
            ScrollView{
            HStack{
                HeaderTitle(text:"Suas tarefas")
                    .padding(.vertical, 24).padding(.leading, 6)
                Button(action: {
                    isFullScreenPresented.toggle()
                }) {
                    ZStack{
                        Circle()
                            .fill(Color.customGreen)
                            .frame(width: 42, height: 42)
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color.bgContent).fontWeight(.semibold)
                    }
                    
                }
            }
            
            
                if let currentDay = viewModel.currentDay {
                    ForEach(currentDay.tasks, id: \.id) { task in
                        TaskView(item: task, id: task.id)
                    }
                } else {
                    
                }
            }
            
        }
        .onAppear {
            
                    }
        
        .fullScreenCover(isPresented: $isFullScreenPresented) {
            AddingTaskView {
                isFullScreenPresented.toggle()
            }
        }
        .frame(maxHeight:.infinity,alignment: .topLeading).safeAreaPadding()
        
        .background(Color.bg)
    }
    
    
}


struct AddingTaskView: View {
    @EnvironmentObject var viewModel: DayViewModel
    var closeFullScreen: () -> Void
    @State var text: String = ""
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack{
            HStack{
       
                   
                   Button(action: {
                       closeFullScreen()
                   }) {
                       ZStack{
                        
                           Image(systemName: "chevron.left")
                               .foregroundColor(Color.textPrimary.opacity(0.8)).fontWeight(.bold).font(.system(size: 24))
                       }
                       
                   }
                    
                
            }.frame(maxWidth: .infinity,alignment: .leading).padding(.vertical,24)

            VStack{
              
                    HeaderTitle(text: "Criar Tarefa 📚").padding(.vertical,24)
                    
               
                
                TextField("Digite sua tarefa", text: $text).padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(18)
                    
                    .accentColor(.blue)
                Spacer()
                Button(action: {
                    closeFullScreen()
                }) {
                    ZStack{
                        Rectangle()
                            .fill(Color.customGreen)
                            .frame(width: .infinity, height: 64)
                            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                       
                        Button(action: {
                            isLoading = true
                            viewModel.addTask(text:text)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    closeFullScreen()
                                    isLoading = false
                            }
                          
                        }) {
                            ZStack{
                                if isLoading {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                        .tint(.black)
                                        
                                }else{
                                    Text("Adicionar Tarefa").foregroundStyle(Color.bgContent).fontWeight(.semibold).font(.system(size:18))
                                }
                               
                                
                            }
                            
                        }
                        
                    }
                    
                }.padding(.vertical,36)
                              
            }
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topLeading).padding(.horizontal,40)
    }
}


