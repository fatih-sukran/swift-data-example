//
//  AddOrder.swift
//  Shoppier Clone
//
//  Created by fatih.sukran on 28.09.2023.
//

import SwiftUI
import PhotosUI

struct AddOrder: View {
    
    @Environment(\.modelContext) var context
    
    @State var bagName: String = ""
    @State var bagPrice: String = ""
    @State var date: Date = Date.now
    @State var imageData: Data?
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    if let image = Image(data: imageData) {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    }
                    SelectImageView(selectedImage: $imageData)
                }
                TextField("Bag Name", text: $bagName)
                TextField("Bag Price", text: $bagName)
                DatePicker("Order Date", selection: $date)
                Section {
                    Button("Save") {
                        guard let imageData = imageData else {
                            return
                        }
                        
                        let order = Order(name: bagName, price: Double(bagPrice) ?? 0, date: date, imageData: imageData)
                        context.insert(order)
                        try? context.save()
                    }
                }
            }
            .navigationTitle("Add Order")
        }
    }
}

#Preview {
    AddOrder()
}
