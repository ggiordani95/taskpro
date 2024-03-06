//
//  Item.swift
//  taskpro
//
//  Created by Gustavo Giordani on 04/03/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
