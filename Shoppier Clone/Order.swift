//
//  Order.swift
//  Shoppier Clone
//
//  Created by fatih.sukran on 29.09.2023.
//

import SwiftUI
import SwiftData

@Model
class Order: Identifiable {
    var id: UUID = UUID()
    var name: String
    var price: Double
    var date: Date
    var imageData: Data
    
    init(name: String, price: Double, date: Date, imageData: Data) {
        self.name = name
        self.price = price
        self.date = date
        self.imageData = imageData
    }
}

