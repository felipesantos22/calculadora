//
//  CalculatorViewModel.swift
//  calculate
//
//  Created by Felipe Santos on 02/12/24.
//

import SwiftData
import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var operations: [Calculator] = []
    @Published var value1: String = ""
    @Published var value2: String = ""
    @Published var selectedOperation: String = ""
    @Published var result: Double = 0.0
    @Published var successMessage: String = ""
    
    var formattedResult: String {
        String(format: "%.2f", result)
    }
    
    func calculateResult(context: ModelContext) {
        guard let val1 = Double(value1), let val2 = Double(value2) else {
            successMessage = "Por favor, insira números válidos."
            return
        }

        switch selectedOperation {
        case "+":
            result = val1 + val2
        case "-":
            result = val1 - val2
        case "×":
            result = val1 * val2
        case "÷":
            if val2 != 0 {
                result = val1 / val2
            } else {
                successMessage = "Erro: Divisão por zero!"
                return
            }
        default:
            successMessage = "Operação inválida."
            return
        }

        // Salva a operação no banco
        let newOperation = Calculator(value1: val1, value2: val2, operation: selectedOperation, result: result)
        context.insert(newOperation)
        
        
        do {
            try context.save()
            print("Salvo com sucesso")
            showSuccessMessage("Operação salva com sucesso!")
            hideResultAfterDelay()
        } catch {
            showSuccessMessage("Erro ao salvar operação.")
        }
        
        clearFields()
    }
    
    func clearHistory(context: ModelContext) {
        for operation in operations {
            context.delete(operation)
        }
        do {
            try context.save()
        } catch {
            print("Erro ao limpar histórico: \(error)")
        }
    }
    
    func clearFields() {
        self.value1 = ""
        self.value2 = ""
    }
    
    func showSuccessMessage(_ message: String) {
        successMessage = message
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.successMessage = ""
        }
    }
    
    func hideResultAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.result = 0
        }
    }
    
    func filterInput(_ input: String) -> String {
        if input.filter({ $0 == "." }).count <= 1 {
            return input.filter { "0123456789.".contains($0) }
        }
        return input
    }
    
    func clearResult(result: Calculator, context: ModelContext) {
        context.delete(result)
        try? context.save()
    }
}
