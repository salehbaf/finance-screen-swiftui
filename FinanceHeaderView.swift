//
//  FinanceHeaderView.swift
//  AS2P2
//
//  Created by Saleh on 2025-10-01.
//

import SwiftUI

struct FinanceHeaderView: View {
    let title: String
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
            Spacer()
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding(.vertical, 12)
    }
}


