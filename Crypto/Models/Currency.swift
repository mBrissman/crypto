//
//  Currency.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation

struct Currency: Equatable {
    let code: String
    let amountPerDollar: Double
}

extension Currency {
    static let sek = Currency(code: "sek", amountPerDollar: 11.0428)
    static let usd = Currency(code: "usd", amountPerDollar: 1)
}
