//
//  TickerList.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

struct TickerList: View {

    @State var viewModel: TickerListModel

    var body: some View {
        NavigationStack {
            List(viewModel.tickers) { ticker in
                TickerRow(ticker: ticker)
            }
            .navigationTitle("Currencies")
            .task {
                await viewModel.refresh()
            }
        }
    }
}

#Preview {
    TickerList(viewModel: TickerListModel(tickers: Ticker.previews))
}
