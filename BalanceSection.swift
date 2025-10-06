//  BalanceSection.swift
//  Created by Saleh on 2025-10-01.


import SwiftUI

struct BalanceSection: View {
    let amountText: String
    let changeText: String
    var body: some View {
        VStack(spacing: 8) {
            Text(amountText)
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack(spacing: 6) {
           
                Text(changeText.components(separatedBy: " ").first ?? changeText)
                    .foregroundColor(.green)
                Text(changeText.replacingOccurrences(of: (changeText.components(separatedBy: " ").first ?? ""), with: "").trimmingCharacters(in: .whitespaces))
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 12)
    }
}
