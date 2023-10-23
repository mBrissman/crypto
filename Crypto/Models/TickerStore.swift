//
//  TickerStore.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation

final class TickerStore {

    private let session = URLSession(configuration: .default)
    private let decoder = JSONDecoder()

    /// Retrieves crypto currency tickers and delivers the data asynchronously.
    func tickers() async throws -> [Ticker] {
        guard let url = URL(string: "https://api.coinlore.net/api/tickers/") else {
            throw TickerStoreError.invalidURL
        }

        // TODO: Handle http status codes
        let (data, _) = try await session.data(from: url)
        let response = try decoder.decode(TickersResponse.self, from: data)

        return response.data
    }
}

enum TickerStoreError: Error {
    case invalidURL
}

private extension TickerStore {
    struct TickersResponse: Decodable {
        let data: [Ticker]
    }
}
