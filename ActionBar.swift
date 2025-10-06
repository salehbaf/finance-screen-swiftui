
//
//  Created by Saleh on 2025-10-01.
//

import SwiftUI

struct ActionBar: View {
    let isEnabled: Bool
    let action: () -> Void

    var body: some View {
        Button("Continue") {
            action()
        }
        .font(.headline)
        .frame(maxWidth: .infinity)
        .padding()
        .background(isEnabled ? Color.blue : Color.gray.opacity(0.3))
        .foregroundColor(.white)
        .cornerRadius(12)
        .disabled(!isEnabled)
        .padding(.vertical, 12)
    }
}
