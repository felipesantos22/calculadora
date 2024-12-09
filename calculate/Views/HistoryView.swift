//
//  history.swift
//  calculate
//
//  Created by Felipe Santos on 01/12/24.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    
    @Query(sort: \CalculatorModel.id, order: .forward) private var history: [CalculatorModel]
    
    var body: some View {
        ZStack{
            Image("back")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            List(history) { record in
                VStack(alignment: .leading) {
                    Text("ID: \(record.id)")
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
            .navigationTitle("Histórico")
            .navigationBarTitleDisplayMode(.large)
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
