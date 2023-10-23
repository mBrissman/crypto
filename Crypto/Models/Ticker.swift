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
    let price: Double

    init(id: String, name: String, price: Double) {
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

        // Convert price string to double
        let priceString = try container.decode(String.self, forKey: .price)
        if let price = Double(priceString) {
            self.price = price
        } else {
            throw TickerError.invalidPriceFormat
        }
    }
}

enum TickerError: Error {
    case invalidPriceFormat
}
