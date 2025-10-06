//
//  Part1View.swift
//  AS2
//
//  Created by SDOT on 2025-10-01.
//

import SwiftUI

struct Part1View: View {
    @State private var name = ""
    @State private var email = ""
    @State private var bountyID = ""

    @State private var secretPower = ""
    @State private var confirmPower = ""

    @State private var joinForever = false
    @State private var treasureUpdates = true

    @State private var bounty: Double = 50
    @State private var showAlert = false

    var isNameValid: Bool { name.trimmingCharacters(in: .whitespaces).count >= 2 }
    var isEmailValid: Bool { email.contains("@") && email.contains(".") }
    var isBountyIDValid: Bool {
        (3...20).contains(bountyID.count) &&
        bountyID.range(of: #"^[A-Za-z0-9_]+$"#, options: .regularExpression) != nil
    }
    var isSecretValid: Bool { secretPower.count >= 3 }
    var isConfirmMatch: Bool { !confirmPower.isEmpty && confirmPower == secretPower }

    var isFormValid: Bool {
        isNameValid && isEmailValid && isBountyIDValid && isSecretValid && isConfirmMatch
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // Header
                VStack(spacing: 10) {
                    Image(systemName: "sailboat.fill")
                        .font(.system(size: 56))
                        .foregroundColor(.red)
                    Text("Straw Hat Pirates").font(.largeTitle).bold()
                    Text("Join The Crew").font(.subheadline).foregroundColor(.secondary)
                    Text("“I'm gonna be King of the Pirates!”")
                        .font(.callout).italic().bold().foregroundColor(.red)
                }
                .frame(maxWidth: .infinity)

                // Sections
                PersonalInfoSection(name: $name, email: $email, bountyID: $bountyID)

                DevilFruitSection(secretPower: $secretPower, confirmPower: $confirmPower)

                CrewPreferencesSection(joinForever: $joinForever, treasureUpdates: $treasureUpdates)

                BountySection(bounty: $bounty)

                // Actions
                VStack(spacing: 12) {
                    Button {
                        showAlert = true
                    } label: {
                        Label("Set Sail", systemImage: "sailboat.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(isFormValid ? .red : .gray)
                    .disabled(!isFormValid)
                    .opacity(isFormValid ? 1 : 0.5)

                    Button("Reset") { resetForm() }
                        .buttonStyle(.bordered)
                }
            }
            .padding()
        }
        .alert("Welcome to the Crew! 🎉", isPresented: $showAlert) {
            Button("Start Adventure") {
                resetForm()
            }
            Button("Stay Here", role: .cancel) { }
        } message: {
            Text("You're now a Straw Hat Pirate with a \(formatBountyFull(bounty)) berry bounty!")
        }
    }

    private func resetForm() {
        name = ""; email = ""; bountyID = ""
        secretPower = ""; confirmPower = ""
        joinForever = false; treasureUpdates = true
        bounty = 50
    }
    private func formatBounty(_ v: Double) -> String {
        if v >= 1_000_000 { return "\(Int(v/1_000_000))M฿" }
        if v >= 1_000     { return "\(Int(v/1_000))K฿" }
        return "\(Int(v))฿"
    }
    private func formatBountyFull(_ v: Double) -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.groupingSeparator = ","
        let n = nf.string(from: NSNumber(value: Int(v))) ?? "\(Int(v))"
        return "\(n)฿"
    }
}
#Preview{
    Part1View()
}
