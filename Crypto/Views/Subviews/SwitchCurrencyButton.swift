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
            if currency.wrappedValue == .dollar {
                Label("Switch to bitcoin", systemImage: "bitcoinsign.arrow.circlepath")
            } else {
                Label("Switch to dollar", systemImage: "dollarsign.arrow.circlepath")
            }
        }
    }

    private func toggleCurrency() {
        withAnimation {
            if currency.wrappedValue == .dollar {
                self.currency.wrappedValue = .bitcoin
            } else {
                self.currency.wrappedValue = .dollar
            }
        }
    }
}

#Preview {
    SwitchCurrencyButton()
}
