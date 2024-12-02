//
//  CalculatorViewModel.swift
//  calculate
//
//  Created by Felipe Santos on 02/12/24.
//

// ViewModels/CalculatorViewModel.swift
import SwiftUI

class CalculatorViewModel: ObservableObject {
    
    @Published var value1: String = ""
    @Published var value2: String = ""
    @Published var result: String = "0"
    @Published var history: [OperationRecord] = []
    @Published var successMessage: String? = nil
    private var nextID: Int = 1

    enum Operation {
        case add, subtract, multiply, divide
    }

    func calculate(_ operation: Operation) {
        guard let num1 = Double(value1), let num2 = Double(value2) else {
            result = "Erro"
            return
        }
        
        var operationResult: Double = 0
        var operationSymbol: String = ""
        
        switch operation {
        case .add:
            operationResult = num1 + num2
            operationSymbol = "+"
        case .subtract:
            operationResult = num1 - num2
            operationSymbol = "-"
        case .multiply:
            operationResult = num1 * num2
            operationSymbol = "×"
        case .divide:
            if num2 != 0 {
                operationResult = num1 / num2
                operationSymbol = "÷"
            } else {
                result = "Divisão por zero"
                return
            }
        }
        
        result = String(format: "%.1f", operationResult)
        
        let record = OperationRecord(
            id: nextID,
            value1: value1,
            value2: value2,
            operation: operationSymbol,
            result: operationResult,
            timestamp: getCurrentTimestamp()
        )
        history.insert(record, at: 0)
        
        successMessage = "Cálculo armazenado com sucesso!"
        
        value1 = ""
        value2 = ""
        
        nextID += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.successMessage = nil
        }
}

}
