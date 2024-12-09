//
//  calculateApp.swift
//  calculate
//
//  Created by Felipe Santos on 01/12/24.
//

import SwiftUI

@main
struct CalculateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [CalculatorModel.self])
        }
    }
}

