//
//  TickerListModel.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation

@Observable
final class TickerListModel {
    var tickers: [Ticker] = []

    init(tickers: [Ticker] = []) {
        self.tickers = tickers
    }
}
