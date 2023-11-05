//
//  CurrencyEnvironmentKey.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

private struct CurrencyEnvironmentKey: EnvironmentKey {
    static let defaultValue: Binding<Currency> = .constant(.dollar)
}

extension EnvironmentValues {

    /// Environment value for currency binding.
    /// Used to read and set the currency used across the environment.
    /// - Note: Use wrapped value to update the currency.
    var currency: Binding<Currency> {
        get { self[CurrencyEnvironmentKey.self] }
        set { self[CurrencyEnvironmentKey.self] = newValue }
    }
}

extension View {

    /// Sets the currency environment value for the view.
    func currency(_ currency: Binding<Currency>) -> some View {
        environment(\.currency, currency)
    }
}
