//
//  APISession.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation

/// An object that coordinates requests to the Coin Lore API.
final class APISession {

    private let session = URLSession(configuration: .default)
    private let decoder = JSONDecoder()

    /// Retrieves crypto currency tickers and delivers the data asynchronously.
    /// - Note: Returns cached tickers if not connected to internet.
    func tickers() async throws -> [Ticker] {

        guard let url = URL(string: "https://api.coinlore.net/api/tickers/") else {
            throw APISessionError.invalidURL
        }

        let request = URLRequest(url: url)
        let (data, response) = try await data(for: request)

        guard let response = response as? HTTPURLResponse else {
            throw APISessionError.invalidResponse
        }

        guard response.statusCode == 200 else {
            throw APISessionError.unexpectedStatusCode
        }

        let result = try decoder.decode(Result.self, from: data)
        return result.data
    }

    /// Returns data for request if connected to internet, returns cached data otherwise.
    private func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await session.data(for: request)
        } catch let error as URLError where error.code == .notConnectedToInternet {
            return try cachedData(for: request)
        } catch {
            throw error
        }
    }

    /// Returns cached data for request from session cache.
    private func cachedData(for request: URLRequest) throws -> (Data, URLResponse) {
        guard let cache = session.configuration.urlCache else {
            throw APISessionError.noCache
        }

        guard let cachedResponse = cache.cachedResponse(for: request) else {
            throw APISessionError.noCachedResponse
        }

        return (cachedResponse.data, cachedResponse.response)
    }
}

enum APISessionError: Error {
    case invalidURL
    case invalidResponse
    case unexpectedStatusCode
    case noCache
    case noCachedResponse
}

extension APISession {
    struct Result: Decodable {
        let data: [Ticker]
    }
}
