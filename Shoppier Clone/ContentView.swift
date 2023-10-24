//
//  ContentView.swift
//  Shoppier Clone
//
//  Created by fatih.sukran on 27.09.2023.
//

import SwiftUI
import SwiftData

struct Bag {
    let image: Image
    let name: String
    let price: Double
    let date: Date
}

struct TabItem: View {
    let text: String
    let id: Int
    @Binding var selectedId: Int
    
    func isActive() -> Bool {
        return selectedId == id
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Button(text) {
                selectedId = id
            }
            .foregroundStyle(isActive() ? .black : .gray)
            .padding(.bottom, 11)
            .bold()
            
            Divider()
                .frame(width: isActive() ? 30 : 0, height: isActive() ? 4 : 0)
                .overlay(isActive() ? .indigo : .gray)
        }
        .padding(.trailing, 30)
    }
}

struct CardImage: View {

    var body: some View{
        ZStack(alignment: .topTrailing) {
            Image(data: order.imageData)!
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(21)
                .padding(.top, 5)
                .padding(.trailing, 5)
            
            ZStack {
                Rectangle()
                    .frame(width: 22, height: 22)
                    .cornerRadius(15, corner: .bottomLeft)
                    .cornerRadius(15, corner: .bottomRight)
                    .cornerRadius(15, corner: .topLeft)
                    .foregroundStyle(.white)
                
                Circle()
                    .frame(width: 13, height: 13)
                    .foregroundColor(Color(red: 115 / 255, green: 240 / 255, blue: 200 / 255))
            }
        }
    }
}

struct Card: View {
    
    @Environment(\.modelContext) var context
    @State var order: Order
    
    var body: some View {
        HStack(alignment: .top) {
            CardImage()
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(order.name)
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 2)
                        Text("\(order.price.formatted()) TL")
                            .foregroundStyle(.gray)
                            .padding(.bottom, 2)
                    }
                    Spacer()
                    Text("⋮")
                        .font(.system(size: 32))
                        .foregroundColor(.black)
                        .bold()
                }
                
                Text( "43424235 - \(getDate())")
                    .foregroundStyle(.gray)
                    .padding(.trailing, 21)
            }
        }
        .padding(.top, 10)
        
    }
    
    func getDate() -> String {
        let day = order.date.day
        let monthName = order.date.getMonthName()
        let time = order.date.formatted(date: Date.FormatStyle.DateStyle.omitted, time: Date.FormatStyle.TimeStyle.shortened)
        return "\(day) \(monthName) \(time)"
    }
}

struct ContentView: View {
    @State private var selectedTab: Int = 1
    @Query var orders: [Order]
    
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    HStack {
                        TabItem(text: "Tümü", id: 0, selectedId: $selectedTab)
                        TabItem(text: "Açık", id: 1, selectedId: $selectedTab)
                        TabItem(text: "Kapalı", id: 2, selectedId: $selectedTab)
                        Spacer()
                    }
                    Divider()
                }
                Text("Siparişler")
                    .font(.title)
                Text("Siparişler")
                ForEach(orders, id: \.self) { order in
                    Card(order: order)
                }
            }
            .padding(21)
            .navigationTitle("Siparişler")
            .navigationBarItems(trailing: NavigationLink(destination: AddOrder()) {
                Text("Add")
            })
        }
    }
}

extension Font {
    static func customFont(_ name: String, size: CGFloat) -> Font {
        guard let customFont = UIFont(name: name, size: size) else {
            fatalError("Failed to load the custom font named: \(name)")
        }
        return Font(customFont)
    }
}

#Preview {
    ContentView()
    
        .font(.custom("Gilroy-Regular", size: 21))
}
