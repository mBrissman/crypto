//
//  TickerListModel.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation

@Observable
final class TickerListModel {

    private let store = TickerStore()

    var tickers: [Ticker] = []

    init(tickers: [Ticker] = []) {
        self.tickers = tickers
    }

    func refresh() async {
        do {
            tickers = try await store.tickers()
        } catch {
            // TODO: Handle error properly
            print(error)
        }
    }
}
