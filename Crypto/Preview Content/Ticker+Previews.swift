//
//  Ticker+Previews.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation

extension Ticker {

    static let preview = ticker(withName: "Bitcoin", symbol: "BTC")

    static let previews: [Ticker] = [
        ticker(withName: "Bitcoin", symbol: "BTC"),
        ticker(withName: "Ethereum", symbol: "ETH"),
        ticker(withName: "Tether", symbol: "USDT"),
        ticker(withName: "XRP", symbol: "XRP"),
        ticker(withName: "Solana", symbol: "SOL"),
        ticker(withName: "Cardano", symbol: "ADA")
    ]

    private static func ticker(withName name: String, symbol: String) -> Ticker {
        Ticker(
            id: UUID().uuidString,
            name: name,
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
            symbol: symbol
        )
    }
}
