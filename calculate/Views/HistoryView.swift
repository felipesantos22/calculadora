//
//  history.swift
//  calculate
//
//  Created by Felipe Santos on 01/12/24.
//

import SwiftUI

struct HistoryView: View {
    let history: [OperationRecord]
    
    var body: some View {
        List(history.sorted { $0.id < $1.id }) { record in
            VStack(alignment: .leading) {
                Text("ID: \(record.id)")
                Text("\(record.value1) \(record.operation) \(record.value2) = \(String(format: "%.1f", record.result))")
                Text("Data e hora: \(record.timestamp)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 5)
        }
        .navigationTitle("Histórico")
        .navigationBarTitleDisplayMode(.inline) 
    }
}
