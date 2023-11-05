//
//  TickerDetailsView.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

struct TickerDetailsView: View {

    @Environment(\.currency) var currency

    let ticker: Ticker

    private var price: Price {
        ticker.price(in: currency.wrappedValue)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header
                percentChangeList
            }
            .padding([.horizontal, .bottom])
        }
        .navigationTitle(ticker.name)
        .background(.groupedBackground)
        .toolbar {
            SwitchCurrencyButton()
        }
    }

    private var header: some View {
        HStack(spacing: 8) {
            Text(ticker.symbol)
            Text("-")
            Text(price.amount, format: .currency(code: price.currency.code))
            Spacer()
        }
        .foregroundColor(.secondary)
        .font(.subheadline)
    }

    private var percentChangeList: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Change")
                .font(.headline)
            PercentChangeRow("Hour", change: ticker.percentChangeSinceOneHour)
            PercentChangeRow("Day", change: ticker.percentChangeSinceOneDay)
            PercentChangeRow("Week", change: ticker.percentChangeSinceOneWeek)
        }
        .padding()
        .background(.secondaryGroupedBackground, in: RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    NavigationStack {
        TickerDetailsView(ticker: .preview)
    }
}
