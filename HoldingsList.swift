//
//  HoldingsList.swift
//  AS2P2
//
//  Created by Saleh on 2025-10-01.
//

import SwiftUI

struct HoldingsList: View {
    var body: some View {
        VStack(spacing: 12) {
            HoldingRow(symbol: "AAPL", name: "Apple Inc.", price: "$173.50")
            Divider()
            HoldingRow(symbol: "MSFT", name: "Microsoft Corp.", price: "$315.22")
            Divider()
            HoldingRow(symbol: "META", name: "Meta Platforms", price: "$298.44")
        }
        .padding(.vertical, 16)
    }
}

struct HoldingRow: View {
    let symbol: String
    let name: String
    let price: String

    var body: some View {
        HStack {
            Text(symbol)
                .fontWeight(.semibold)
            Text(name)
                .foregroundColor(.secondary)
            Spacer()
            Text(price)
                .fontWeight(.semibold)
        }
    }
}
