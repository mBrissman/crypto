//
//  Ticker+Previews.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation

extension Ticker {

    static let preview = Ticker(
        id: UUID().uuidString,
        name: "Bitcoin",
        percentChangeSinceOneHour: 0.234,
        percentChangeSinceOneDay: 0,
        percentChangeSinceOneWeek: -0.045,
        priceInBitcoin: Price(
            amount: Double.random(in: 0...99999),
            currency: .bitcoin
        ),
        priceInDollar: Price(
            amount: Double.random(in: 0...99999),
            currency: .dollar
        ),
        symbol: "BTC"
    )
}
