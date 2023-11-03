//
//  SwitchCurrencyButton.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

/// Button used to switch environment currency.
struct SwitchCurrencyButton: View {

    @Environment(\.currency) var currency

    var body: some View {
        Button(action: toggleCurrency) {
            if currency.wrappedValue == .usd {
                Label("Switch to SEK", systemImage: "swedishkronasign.arrow.circlepath")
            } else {
                Label("Switch to USD", systemImage: "dollarsign.arrow.circlepath")
            }
        }
    }

    private func toggleCurrency() {
        withAnimation {
            if currency.wrappedValue == .usd {
                self.currency.wrappedValue = .sek
            } else {
                self.currency.wrappedValue = .usd
            }
        }
    }
}

#Preview {
    SwitchCurrencyButton()
}
