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
    let priceInBitcoin: Price
    let priceInDollar: Price
    let symbol: String

    init(id: String,
         name: String,
         percentChangeSinceOneHour: Double,
         percentChangeSinceOneDay: Double,
         percentChangeSinceOneWeek: Double,
         priceInBitcoin: Price,
         priceInDollar: Price,
         symbol: String) {
        self.id = id
        self.name = name
        self.percentChangeSinceOneHour = percentChangeSinceOneHour
        self.percentChangeSinceOneDay = percentChangeSinceOneDay
        self.percentChangeSinceOneWeek = percentChangeSinceOneWeek
        self.priceInBitcoin = priceInBitcoin
        self.priceInDollar = priceInDollar
        self.symbol = symbol
    }
}

extension Ticker {
    func price(in currency: Currency) -> Price {
        switch currency {
        case .bitcoin:
            return priceInBitcoin
        case .dollar:
            return priceInDollar
        }
    }
}

extension Ticker: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case percentChangeSinceOneDay = "percent_change_24h"
        case percentChangeSinceOneHour = "percent_change_1h"
        case percentChangeSinceOneWeek = "percent_change_7d"
        case priceInDollar = "price_usd"
        case priceInBitcoin = "price_btc"
        case symbol
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.percentChangeSinceOneHour = try container.decodeDoubleFromString(forKey: .percentChangeSinceOneHour) / 100
        self.percentChangeSinceOneDay = try container.decodeDoubleFromString(forKey: .percentChangeSinceOneDay) / 100
        self.percentChangeSinceOneWeek = try container.decodeDoubleFromString(forKey: .percentChangeSinceOneWeek) / 100

        // Convert price strings to price objects
        let bitcoinPriceAmount = try container.decodeDoubleFromString(forKey: .priceInBitcoin)
        self.priceInBitcoin = Price(amount: bitcoinPriceAmount, currency: .bitcoin)

        let dollarPriceAmount = try container.decodeDoubleFromString(forKey: .priceInDollar)
        self.priceInDollar = Price(amount: dollarPriceAmount, currency: .dollar)
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
