//
//  QuickAmountPicker.swift
//  AS2P2
//
//  Created by Saleh on 2025-10-01.
//

import SwiftUI

struct QuickAmountPicker: View {
    @Binding var selection: Int

    let amounts = [50, 100, 200, 500]

    var body: some View {
        Picker("Amount", selection: $selection) {
            ForEach(amounts, id: \.self) { amount in
                Text("$\(amount)").tag(amount)
            }
        }
        .pickerStyle(.segmented)
        .padding(.vertical, 12)
    }
}
