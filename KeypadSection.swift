//
//  KeypadSection.swift
//  AS2P2
//
//  Created by Saleh on 2025-10-01.
//

import SwiftUI

struct KeypadSection: View {
    @Binding var text: String

    private let rows: [[String]] = [
        ["1","2","3"],
        ["4","5","6"],
        ["7","8","9"],
        [".","0","⌫"]
    ]

    var body: some View {
        VStack(spacing: 12) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { key in
                        Button {
                            handleTap(key)
                        } label: {
                            Text(key)
                                .font(.title3)
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .padding(.vertical, 6)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }

    private func handleTap(_ key: String) {
        switch key {
        case "⌫":
            if !text.isEmpty { text.removeLast() }
        case ".":
            if !text.contains(".") { text.append(".") }
        default:
            text.append(key)
        }
    }
}
