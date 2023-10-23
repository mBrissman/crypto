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

    @ObservationIgnored private let store = TickerStore()

    private var tickers: [Ticker] = []
    var isRefreshing: Bool = false
    var searchText: String = ""

    var filteredTickers: [Ticker] {
        guard searchText.isEmpty == false else { return tickers }
        return tickers.filter { $0.name.localizedStandardContains(searchText) }
    }

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
