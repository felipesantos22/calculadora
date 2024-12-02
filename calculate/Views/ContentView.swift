//
//  ContentView.swift
//  calculate
//
//  Created by Felipe Santos on 01/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                TextField("Digite o primeiro valor", text: $viewModel.value1)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Digite o segundo valor", text: $viewModel.value2)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack(spacing: 15) {
                    Button(action: {
                        viewModel.calculate(.add)
                        clearResultAfterDelay()
                    }) {
                        Text("+")
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Button(action: {
                        viewModel.calculate(.subtract)
                        clearResultAfterDelay()
                    }) {
                        Text("-")
                            .frame(width: 50, height: 50)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Button(action: {
                        viewModel.calculate(.multiply)
                        clearResultAfterDelay()
                    }) {
                        Text("×")
                            .frame(width: 50, height: 50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Button(action: {
                        viewModel.calculate(.divide)
                        clearResultAfterDelay()
                    }) {
                        Text("÷")
                            .frame(width: 50, height: 50)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                // Result
                Text("Resultado: \(viewModel.result)")
                    .font(.title)
                    .padding()
                
                // Mensagem de sucesso
                if let successMessage = viewModel.successMessage {
                    Text(successMessage)
                        .foregroundColor(.green)
                        .padding()
                        .transition(.opacity)
                }
                
                // Navegação para o histórico, vou refatorar no futuro
                NavigationLink(destination: HistoryView(history: viewModel.history)) {
                    Text("Ver Histórico")
                        .font(.headline)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Calculadora")
            .onAppear {
                viewModel.loadHistory()
            }
        }
    }
    
    // Func para limpar o resultado
    private func clearResultAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            viewModel.result = ""
        }
    }
}
