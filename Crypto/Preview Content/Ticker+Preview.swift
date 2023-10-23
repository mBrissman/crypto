//
//  Ticker+Preview.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation

extension Ticker {

    static let preview = ticker(withName: "Bitcoin")

    static let previews: [Ticker] = [
        ticker(withName: "Bitcoin"),
        ticker(withName: "Ethereum"),
        ticker(withName: "Tether"),
        ticker(withName: "XRP"),
        ticker(withName: "Solana"),
        ticker(withName: "Cardano")
    ]

    private static func ticker(withName name: String) -> Ticker {
        Ticker(
            id: UUID().uuidString,
            name: name,
            price: Double.random(in: 0...99999)
        )
    }
}
