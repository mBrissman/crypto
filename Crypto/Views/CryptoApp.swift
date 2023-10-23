//
//  CryptoApp.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            TickerList(viewModel: TickerListModel(tickers: Ticker.previews))
        }
    }
}
