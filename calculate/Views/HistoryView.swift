//
//  history.swift
//  calculate
//
//  Created by Felipe Santos on 01/12/24.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    
    @Query(sort: \Calculator.timestamp, order: .forward) private var calculator: [Calculator]
    
    var body: some View {
        if calculator.isEmpty {
            Text("Nenhum registro encontrado.")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
        } else {
            List(calculator) { record in
                VStack(alignment: .leading) {
                    Text("ID: \(record.id) Id")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("\(String(format: "%.1f", record.value1)) \(record.operation) \(String(format: "%.1f", record.value2)) = \(String(format: "%.1f", record.result))")
                        .font(.body)
                    Text("Data e hora: \(formattedDate(record.timestamp))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 5)
            }
        }
    }
    // Func para formatar a data
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
