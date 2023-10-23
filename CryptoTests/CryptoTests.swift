//
//  CryptoTests.swift
//  CryptoTests
//
//  Created by Marcus Brissman on 2023-10-23.
//

import XCTest

final class CryptoTests: XCTestCase {

    /// Test currency conversion for price in ticker.
    func testCurrencyConversion() throws {
        let ticker = Ticker(
            id: "1",
            name: "",
            percentChange24Hours: 0,
            price: Price(amount: 1, currency: .usd),
            symbol: ""
        )
        let sekPrice = ticker.price(with: .sek)
        let usdPrice = ticker.price(with: .usd)

        XCTAssertEqual(sekPrice.amount, 11.0428)
        XCTAssertEqual(usdPrice.amount, 1)
    }
}
