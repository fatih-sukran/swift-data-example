//
//  Shoppier_CloneApp.swift
//  Shoppier Clone
//
//  Created by fatih.sukran on 27.09.2023.
//

import SwiftUI

@main
struct Shoppier_CloneApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Order.self])
        }
    }
}
