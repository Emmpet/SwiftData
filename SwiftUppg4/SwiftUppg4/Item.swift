//
//  Item.swift
//  SwiftUppg4
//
//  Created by Emmelie Elisabeth Gabriella Petersson on 2024-11-10.
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


@Model
final class ToDo {
    var name : String
    var done : Bool
    
    init(name : String, done : Bool) {
        self.name = name
        self.done = done
    }
}
