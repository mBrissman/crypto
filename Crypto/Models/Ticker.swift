//
//  Ticker.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation

struct Ticker: Identifiable {

    let id: String
    let name: String
    let price: Price

    init(id: String, name: String, price: Price) {
        self.id = id
        self.name = name
        self.price = price
    }
}

extension Ticker: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price = "price_usd"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)

        // Convert price string to price object
        let amountString = try container.decode(String.self, forKey: .price)

        if let amount = Double(amountString) {
            self.price = Price(amount: amount, currency: .usd)
        } else {
            throw TickerError.invalidPriceFormat
        }
    }
}

extension Ticker {

    /// Returns price converted to currency.
    func price(with currency: Currency) -> Price {
        Price(amount: price.amount * currency.amountPerDollar, currency: currency)
    }
}

enum TickerError: Error {
    case invalidPriceFormat
}
