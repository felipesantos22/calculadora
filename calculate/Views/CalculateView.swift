//
//  CalculateView.swift
//  calculate
//
//  Created by Felipe Santos on 13/12/24.
//
import SwiftUI
import SwiftData

struct CalculateView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("back")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    Text("Calculadora").font(.largeTitle)
                    // Entrada de valor 1
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
                    
                    // Entrada de valor 2
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
                    
                    // Botões de operações
                    HStack(spacing: 15) {
                        ForEach(["+", "-", "×", "÷"], id: \.self) { operation in
                            Button(action: {
                                viewModel.selectedOperation = operation
                                viewModel.calculateResult(context: context)
                            }) {
                                Text(operation)
                                    .frame(width: 50, height: 50)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    // Resultado
                    Text("Resultado: \(viewModel.formattedResult)")
                        .font(.title)
                        .padding()
                    
                    // Mensagem de sucesso
                    if !viewModel.successMessage.isEmpty {
                        Text(viewModel.successMessage)
                            .foregroundColor(.green)
                            .padding()
                            .transition(.opacity)
                    }
                    
                    // Navegação para o histórico
                    NavigationLink(destination: HistoryView()) {
                        Text("Ver Histórico")
                            .font(.headline)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
                    // Botão para limpar histórico
                    Button(action: {
                        viewModel.clearHistory(context: context)
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
            }
        }
    }
}


#Preview {
    HistoryView()
}
