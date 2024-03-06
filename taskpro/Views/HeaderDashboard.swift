//
//  HeaderDashboard.swift
//  taskpro
//
//  Created by Gustavo Giordani on 05/03/24.
//

import Foundation
import SwiftUI

struct HeaderDashboard: View {
   
    var body: some View {
        HStack{
            Image("gg").resizable().frame(maxWidth:51,maxHeight: 51).clipShape( RoundedRectangle(cornerRadius: 16))
            VStack{
                Text("Gustavo G.").foregroundStyle(Color.textPrimary).font(.system(size: 24)).fontWeight(.semibold).frame(maxWidth: .infinity, alignment: .leading)
            }.padding(.leading,6)
           
        }.padding(.leading,6).padding(.bottom,42).background(Color.bgContent.opacity(0.5))
    }
}
