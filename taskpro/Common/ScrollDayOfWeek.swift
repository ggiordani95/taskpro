import SwiftUI

struct ScrollDayOfWeek: View {
    @EnvironmentObject var dayVM: DayViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(dayVM.days){
                    weekDay in
                    VStack{
                        HStack{
                            DayLabel(onClick: {
                                dayVM.changeCurrentDay(day:weekDay)
                            }, weekDayName: weekDay.dayName, weekDayOfWeek: weekDay.dayOfWeek)
                        }
                    }
                }
            }

        }.padding(.top, 12)
    }
}


