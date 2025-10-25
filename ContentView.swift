import SwiftUI

struct ContentView: View {
    @State private var inputValue: String = ""
    @State private var calculated30: Double? = nil
    @State private var calculated70: Double? = nil
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 25) {
                Text("Calculadora 30%")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                VStack(spacing: 12) {
                    TextField("Digite um valor (ex.: 199,90)", text: $inputValue)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.title2)
                    
                    Button(action: calculate) {
                        Text("Calcular")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                
                if let c30 = calculated30, let c70 = calculated70 {
                    VStack(spacing: 12) {
                        Text("💰 Valor original: R$ \(formatNumber(value: Double(inputValue) ?? 0))")
                            .foregroundColor(.white)
                        Text("🎯 30% do valor: R$ \(formatNumber(value: c30))")
                            .foregroundColor(.purple)
                        Text("💼 Restante (70%): R$ \(formatNumber(value: c70))")
                            .foregroundColor(.white)
                        Text("📊 Resumo: 30% de R$ \(formatNumber(value: Double(inputValue) ?? 0)) = R$ \(formatNumber(value: c30)) (restam R$ \(formatNumber(value: c70)))")
                            .foregroundColor(.gray)
                            .font(.footnote)
                            .padding(.top, 8)
                    }
                    .padding()
                }
                Spacer()
                Text("Funciona offline. Feito com 💜")
                    .foregroundColor(.gray)
                    .padding(.bottom, 30)
            }
            .padding()
        }
    }
    
    func calculate() {
        guard let value = Double(inputValue.replacingOccurrences(of: ",", with: ".")) else { return }
        calculated30 = value * 0.3
        calculated70 = value * 0.7
    }
    
    func formatNumber(value: Double) -> String {
        String(format: "%.2f", value).replacingOccurrences(of: ".", with: ",")
    }
}

#Preview {
    ContentView()
}
