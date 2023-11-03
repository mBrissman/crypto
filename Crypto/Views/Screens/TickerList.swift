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
            List {
                // TODO: Add error and empty state
                if viewModel.isRefreshing && viewModel.filteredTickers.isEmpty == true {
                    ProgressRow()
                } else {
                    ForEach(viewModel.filteredTickers) { ticker in
                        NavigationLink(
                            destination: { TickerDetailsView(ticker: ticker) },
                            label: { TickerRow(ticker: ticker) }
                        )
                    }
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Currencies")
            .task {
                await viewModel.refresh()
            }
            .toolbar {
                SwitchCurrencyButton()
            }
            .errorAlert(
                error: viewModel.latestError,
                isPresented: $viewModel.errorIsPresented
            )
        }
    }
}

#Preview {
    TickerList(viewModel: TickerListModel(tickers: Ticker.previews))
}
