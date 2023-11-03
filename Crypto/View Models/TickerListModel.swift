//
//  TickerListModel.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

@Observable
final class TickerListModel {

    private let apiSession = APISession()

    private var tickers: [Ticker] = []
    var isRefreshing: Bool = false
    var searchText: String = ""
    var latestError: Error?
    var errorIsPresented: Bool = false

    /// Tickers filtered on search text. Returns all if search text is empty.
    var filteredTickers: [Ticker] {
        guard searchText.isEmpty == false else { return tickers }
        return tickers.filter { $0.name.localizedStandardContains(searchText) }
    }

    init(tickers: [Ticker] = []) {
        self.tickers = tickers
    }

    /// Fetches tickers asynchronously. The result is populated with animation.
    @Sendable
    func refresh() async {
        
        isRefreshing = true
        defer { isRefreshing = false }

        do {
            let tickers = try await apiSession.tickers()
            withAnimation {
                self.tickers = tickers
            }
        } catch {
            latestError = error
            errorIsPresented = true
        }
    }
}
