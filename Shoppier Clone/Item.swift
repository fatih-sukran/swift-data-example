//
//  Item.swift
//  Shoppier Clone
//
//  Created by fatih.sukran on 27.09.2023.
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
