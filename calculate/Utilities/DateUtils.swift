//
//  DateUtils.swift
//  calculate
//
//  Created by Felipe Santos on 01/12/24.
//

import Foundation

// Func para formatar a data
func getCurrentTimestamp() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
    return formatter.string(from: Date())
}

// Func para validar apenas num nos
func filterInput(_ input: String) -> String {
    if input.filter({ $0 == "." }).count <= 1 {
        return input.filter { "0123456789.".contains($0) }
    }
    return input
}
