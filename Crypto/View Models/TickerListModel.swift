//
//  TickerListModel.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation
import SwiftUI

@Observable
final class TickerListModel {

    private let store = TickerStore()

    var tickers: [Ticker] = []
    var isRefreshing: Bool = false

    init(tickers: [Ticker] = []) {
        self.tickers = tickers
    }

    func refresh() async {
        
        isRefreshing = true
        defer { isRefreshing = false }

        do {
            let tickers = try await store.tickers()
            withAnimation {
                self.tickers = tickers
            }
        } catch {
            // TODO: Handle error properly
            print(error)
        }
    }
}
