//
//  CalculaterPopup.swift
//  MoneyManager
//
//  Created by CDMI on 18/03/26.
//

import SwiftUI

struct CalculaterPopup: View {
    
    @Binding var show: Bool
    @Binding var amount: String
    
    @State private var current = "0"
    @State private var expression = ""
    @State private var history = ""
    
    let grid = [
        ["7","8","9","÷"],
        ["4","5","6","×"],
        ["1","2","3","-"],
        [".","0","⌫","+"]
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
          
            VStack(alignment: .trailing) {
                Text(history)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                
                Text(current)
                    .font(.system(size: 32, weight: .bold))
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()
            .background(Color(.systemGray6))
            
           
            VStack(spacing: 0) {
                ForEach(grid, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                handleTap(item)
                            } label: {
                                Text(item)
                                    .frame(maxWidth: .infinity, minHeight: 60)
                                    .font(.system(size: 22))
                            }
                        }
                    }
                }
                
                Button {
                    calculate()
                } label: {
                    Text("=")
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .font(.system(size: 22))
                }
                .background(Color.blue.opacity(0.2))
            }
           
            HStack {
                Button("CLEAR") {
                    clearAll()
                }
                Spacer()
                Button("CANCEL") {
                    withAnimation { show = false }
                }
                Spacer()
                Button("OK") {
                    amount = current
                    withAnimation { show = false }
                }
            }
            .padding()
            .font(.system(size: 14, weight: .bold))
        }
        .frame(width: 300)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }

    func handleTap(_ value: String) {
        
        switch value {
            
        case "0"..."9":
            if current == "0" {
                current = value
            } else {
                current += value
            }
            
        case ".":
            if !current.contains(".") {
                current += "."
            }
            
        case "⌫":
            if !current.isEmpty {
                current.removeLast()
                if current.isEmpty { current = "0" }
            }
            
        case "+","-","×","÷":
            expression += current + convertOperator(value)
            history = expression
            current = "0"
            
        default:
            break
        }
    }
    
    func calculate() {
        let finalExpression = expression + current
        
        let exp = NSExpression(format: finalExpression)
        let result = exp.expressionValue(with: nil, context: nil) as? Double ?? 0
        
        current = format(result)
        history = finalExpression + " ="
        
        expression = "" 
    }
    
    func clearAll() {
        current = "0"
        expression = ""
        history = ""
    }
    
    func convertOperator(_ op: String) -> String {
        switch op {
        case "×": return "*"
        case "÷": return "/"
        default: return op
        }
    }
    
    func format(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        }
        return String(value)
    }
}

#Preview {
    CalculaterPopup(show: .constant(true), amount: .constant("5000"))
}
