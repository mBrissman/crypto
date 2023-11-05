//
//  DecodingTests.swift
//  CryptoTests
//
//  Created by Marcus Brissman on 2023-10-23.
//

import XCTest
@testable import Crypto

final class DecodingTests: XCTestCase {

    private let jsonDecoder = JSONDecoder()
    private let bundle = Bundle(for: DecodingTests.self)

    func testDecodingSearchResult() throws {
        let optionalURL = bundle.url(forResource: "Tickers", withExtension: "json")
        let url = try XCTUnwrap(optionalURL)
        let data = try Data(contentsOf: url)
        let result = try jsonDecoder.decode(APISession.Result.self, from: data)
        let ticker = try XCTUnwrap(result.data.first)

        XCTAssertEqual(ticker.name, "Bitcoin")
        XCTAssertEqual(ticker.priceInDollar.amount, 6456.52)
        XCTAssertEqual(ticker.priceInDollar.currency, .dollar)
        XCTAssertEqual(ticker.priceInBitcoin.amount, 1)
        XCTAssertEqual(ticker.priceInBitcoin.currency, .bitcoin)
        XCTAssertEqual(ticker.percentChangeSinceOneHour, 0.0005)
        XCTAssertEqual(ticker.percentChangeSinceOneDay, -0.0147)
        XCTAssertEqual(ticker.percentChangeSinceOneWeek, -0.0137)
    }
}
