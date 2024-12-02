//
//  Untitled.swift
//  calculate
//
//  Created by Felipe Santos on 01/12/24.
//

import Foundation

struct OperationRecord: Identifiable, Codable {
    let id: Int
    let value1: String
    let value2: String
    let operation: String
    let result: Double
    let timestamp: String
}


