//
//  CryptoApp.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

@main
struct CryptoApp: App {

    // Currency selected by the user.
    @State private var currency: Currency = .usd

    var body: some Scene {
        WindowGroup {
            TickerList(viewModel: TickerListModel())
                .currency($currency)
        }
    }
}
