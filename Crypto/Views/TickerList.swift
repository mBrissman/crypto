//
//  TickerList.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

struct TickerList: View {

    @State var viewModel: TickerListModel
    @State var selectedCurrency: Currency = .usd

    var body: some View {
        NavigationStack {
            List(viewModel.tickers) { ticker in
                TickerRow(ticker: ticker, currency: selectedCurrency)
            }
            .navigationTitle("Currencies")
            .task {
                await viewModel.refresh()
            }
            .toolbar {
                ToolbarItem {
                    currencyButton
                }
            }
        }
    }

    private func toggleCurrency() {
        withAnimation {
            if selectedCurrency == .usd {
                selectedCurrency = .sek
            } else {
                selectedCurrency = .usd
            }
        }
    }

    private var currencyButton: some View {
        Button(action: toggleCurrency) {
            if selectedCurrency == .usd {
                Label("SEK", systemImage: "swedishkronasign.arrow.circlepath")
            } else {
                Label("USD", systemImage: "dollarsign.arrow.circlepath")
            }
        }
    }
}

#Preview {
    TickerList(viewModel: TickerListModel(tickers: Ticker.previews))
}
