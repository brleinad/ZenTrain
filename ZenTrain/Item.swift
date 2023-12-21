//
//  Item.swift
//  ZenTrain
//
//  Created by Daniel RB on 2023-12-20.
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
