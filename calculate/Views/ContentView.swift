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
            ZStack {
                Image("back")
                    .resizable()
                                        .scaledToFill()
                                        .ignoresSafeArea()
                
            
            VStack(spacing: 20) {
                
                VStack(alignment: .leading) {
                    Text("Valor 1")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("100", text: $viewModel.value1)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 200)
                        .padding(.vertical, 5)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Valor 2")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("100", text: $viewModel.value2)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 200)
                        .padding(.vertical, 5)
                }
                .padding()
                
                
                HStack(spacing: 15) {
                    Button(action: {
                        viewModel.calculate(.add)
                        clearResultAfterDelay()
                    }) {
                        Text("+")
                            .frame(width: 50, height: 50)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Button(action: {
                        viewModel.calculate(.subtract)
                        clearResultAfterDelay()
                    }) {
                        Text("-")
                            .frame(width: 50, height: 50)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Button(action: {
                        viewModel.calculate(.multiply)
                        clearResultAfterDelay()
                    }) {
                        Text("×")
                            .frame(width: 50, height: 50)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Button(action: {
                        viewModel.calculate(.divide)
                        clearResultAfterDelay()
                    }) {
                        Text("÷")
                            .frame(width: 50, height: 50)
                            .background(Color.black)
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
                
                Button(action: {
                    viewModel.clearHistory()  // Chama o método para limpar o histórico
                }) {
                    Text("Limpar Histórico")
                        .font(.headline)
                        .padding()
                        .frame(width: 140, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
            .navigationTitle("Calculadora")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.loadHistory()
            }
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
