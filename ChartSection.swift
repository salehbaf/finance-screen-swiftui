//
//  ChartSection.swift
//  AS2P2
//
//  Created by Saleh on 2025-10-01.
//

import SwiftUI

struct ChartSection: View {
    @Binding var selectedRange: String
    private var data: [CGFloat] {
        switch selectedRange {
        case "1D": return [22,18,24,30,28,26,34,40,36,42,38,44,36,30,28,26,24,20]
        case "1W": return [14,22,18,28,20,26,32,30,24,18,22,28,26,20,16,18,22,30]
        case "1M": return [10,12,16,14,18,22,28,24,20,26,30,34,28,24,18,16,14,12,10]
        default:   return [8,10,12,14,16,18,20,22,24,26,28,24,22,20,18,16,14,12,10]
        }
    }

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.1))
                HStack(alignment: .bottom, spacing: 4) {
                    ForEach(Array(data.enumerated()), id: \.offset) { _, h in
                        Capsule()
                            .fill(Color.gray.opacity(0.35))
                            .frame(width: 6, height: max(6, h))
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 16)
            }
            .frame(height: 160)
            Picker("Range", selection: $selectedRange) {
                Text("1D").tag("1D")
                Text("1W").tag("1W")
                Text("1M").tag("1M")
                Text("1Y").tag("1Y")
            }
            .pickerStyle(.segmented)
        }
    }
}
