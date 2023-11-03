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
    let percentChangeSinceOneHour: Double
    let percentChangeSinceOneDay: Double
    let percentChangeSinceOneWeek: Double
    let price: Price
    let symbol: String

    init(id: String, name: String, percentChangeSinceOneHour: Double, percentChangeSinceOneDay: Double, percentChangeSinceOneWeek: Double, price: Price, symbol: String) {
        self.id = id
        self.name = name
        self.percentChangeSinceOneHour = percentChangeSinceOneHour
        self.percentChangeSinceOneDay = percentChangeSinceOneDay
        self.percentChangeSinceOneWeek = percentChangeSinceOneWeek
        self.price = price
        self.symbol = symbol
    }
}

extension Ticker: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case percentChangeSinceOneDay = "percent_change_24h"
        case percentChangeSinceOneHour = "percent_change_1h"
        case percentChangeSinceOneWeek = "percent_change_7d"
        case price = "price_usd"
        case symbol
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.symbol = try container.decode(String.self, forKey: .symbol)

        // Convert change strings to double
        self.percentChangeSinceOneHour = try container.decodeDoubleFromString(forKey: .percentChangeSinceOneHour)
        self.percentChangeSinceOneDay = try container.decodeDoubleFromString(forKey: .percentChangeSinceOneDay)
        self.percentChangeSinceOneWeek = try container.decodeDoubleFromString(forKey: .percentChangeSinceOneWeek)

        // Convert price string to price object
        let amount = try container.decodeDoubleFromString(forKey: .price)
        self.price = Price(amount: amount, currency: .usd)
    }
}

extension Ticker {

    /// Returns price converted to currency.
    func price(with currency: Currency) -> Price {
        Price(amount: price.amount * currency.exchangeRate, currency: currency)
    }
}

private extension KeyedDecodingContainer {

    /// Convenience function for decoding a string from key and then converting it to a double.
    func decodeDoubleFromString(forKey key: KeyedDecodingContainer<K>.Key) throws -> Double {
        let string = try decode(String.self, forKey: key)
        if let double = Double(string) {
            return double
        } else {
            throw KeyedDecodingContainerError.cannotConvertString
        }
    }
}

enum KeyedDecodingContainerError: Error {
    case cannotConvertString
}
