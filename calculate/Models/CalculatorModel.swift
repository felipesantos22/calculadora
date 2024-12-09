//
//  Untitled.swift
//  calculate
//
//  Created by Felipe Santos on 01/12/24.
//

import SwiftUI
import SwiftData

@Model
class CalculatorModel {
    var id: UUID
    var value1: Double
    var value2: Double
    var operation: String
    var result: Double
    var timestamp: Date
    
    init(value1: Double, value2: Double, operation: String, result: Double, timestamp: Date = Date()) {
        self.id = UUID()
        self.value1 = value1
        self.value2 = value2
        self.operation = operation
        self.result = result
        self.timestamp = timestamp
    }
}
