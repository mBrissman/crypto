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
    let percentChange24Hours: Double
    let price: Price
    let symbol: String

    init(id: String, name: String, percentChange24Hours: Double, price: Price, symbol: String) {
        self.id = id
        self.name = name
        self.percentChange24Hours = percentChange24Hours
        self.price = price
        self.symbol = symbol
    }
}

extension Ticker: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case percentChange24Hours = "percent_change_24h"
        case price = "price_usd"
        case symbol
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.symbol = try container.decode(String.self, forKey: .symbol)

        // Convert change string to double
        let percentChange24HoursString = try container.decode(String.self, forKey: .percentChange24Hours)
        if let change = Double(percentChange24HoursString) {
            self.percentChange24Hours = change / 100
        } else {
            throw TickerError.cannotConvertString
        }

        // Convert price string to price object
        let amountString = try container.decode(String.self, forKey: .price)

        if let amount = Double(amountString) {
            self.price = Price(amount: amount, currency: .usd)
        } else {
            throw TickerError.cannotConvertString
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
    case cannotConvertString
}
