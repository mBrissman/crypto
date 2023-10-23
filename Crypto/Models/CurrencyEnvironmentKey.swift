//
//  CurrencyEnvironmentKey.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

private struct CurrencyEnvironmentKey: EnvironmentKey {
    static let defaultValue: Binding<Currency> = .constant(.usd)
}

extension EnvironmentValues {
    var currency: Binding<Currency> {
        get { self[CurrencyEnvironmentKey.self] }
        set { self[CurrencyEnvironmentKey.self] = newValue }
    }
}

extension View {
    func currency(_ currency: Binding<Currency>) -> some View {
        environment(\.currency, currency)
    }
}
