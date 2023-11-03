//
//  TickerList.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

struct TickerList: View {

    @State var viewModel = TickerListModel()

    var body: some View {
        NavigationStack {
            List(viewModel.filteredTickers) { ticker in
                NavigationLink(
                    destination: { TickerDetailsView(ticker: ticker) },
                    label: { TickerRow(ticker: ticker) }
                )
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Currencies")
            .task(viewModel.refresh)
            .overlay(content: emptyView)
            .toolbar {
                SwitchCurrencyButton()
            }
            .errorAlert(
                error: viewModel.latestError,
                isPresented: $viewModel.errorIsPresented
            )
        }
    }

    @ViewBuilder
    private func emptyView() -> some View {
        if viewModel.filteredTickers.isEmpty {
            if viewModel.isRefreshing {
                ProgressView()
            } else {
                Text("No currencies found")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    TickerList(viewModel: TickerListModel())
}
