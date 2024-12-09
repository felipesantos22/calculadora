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
    @Attribute(.unique) var id: Int
    var value1: Double
    var value2: Double
    var operation: String
    var result: Double
    var timestamp: Date
    
    static var lastID: Int = 0 
    
    init(value1: Double, value2: Double, operation: String, result: Double, timestamp: Date = Date()) {
        self.id = CalculatorModel.getNextID()
        self.value1 = value1
        self.value2 = value2
        self.operation = operation
        self.result = result
        self.timestamp = timestamp
    }
    
    // Func para obter o próximo ID sequencial
    static func getNextID() -> Int {
        lastID += 1
        return lastID
    }
}
