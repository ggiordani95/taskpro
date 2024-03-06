import Foundation
import SwiftUI

struct HeaderTitle: View{
    var text: String
    var body: some View {
        Text(text).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.semibold).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.textPrimary)
    }
}
