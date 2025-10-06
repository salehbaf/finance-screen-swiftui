//
//  FinanceScreenView.swift
//  AS2P2
//
//  Created by Saleh on 2025-10-01.
//

import SwiftUI

struct FinanceScreenView: View {
    @State private var selectedRange: String = "1D"
    @State private var quickAmount: Int = 50
    @State private var amountText: String = ""
    @State private var showAlert = false

    // Validator for ActionBar
    private var isValidAmount: Bool {
        guard let value = Double(amountText) else { return false }
        return value > 0
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                FinanceHeaderView(title: "Bitcoin")
                BalanceSection(amountText: "$168,025.97", changeText: "+2.65% Today")
                    .padding(.top, 4)
                
                ChartSection(selectedRange: $selectedRange)
                HoldingsList()
                QuickAmountPicker(selection: $quickAmount)
                    .onChange(of: quickAmount) {
                        amountText = String(quickAmount)
                    }
                    .onChange(of: amountText) {
                      
                        if amountText.count > 1, amountText.first == "0", !amountText.contains(".") {
                            let trimmed = amountText.drop(while: { $0 == "0" })
                            amountText = trimmed.isEmpty ? "0" : String(trimmed)
                        }
                    }
                Text(amountText.isEmpty ? "$0" : "$\(amountText)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 4)
                KeypadSection(text: $amountText)
                ActionBar(isEnabled: isValidAmount) {
                    showAlert = true
                    amountText = ""   // reset after confirming
                }
                .padding(.vertical, 12)
            }
            .padding(.horizontal)
            .alert("Transaction Complete", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

#Preview {
    FinanceScreenView()
}
