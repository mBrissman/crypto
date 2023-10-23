//
//  Currency.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation

struct Currency: Equatable {

    /// Currency ISO code.
    let code: String

    /// Exchange rate from one dollar to the currency.
    let exchangeRate: Double
}

extension Currency {
    static let sek = Currency(code: "sek", exchangeRate: 11.0428)
    static let usd = Currency(code: "usd", exchangeRate: 1)
}
