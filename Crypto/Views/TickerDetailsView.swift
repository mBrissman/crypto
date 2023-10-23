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

    var price: Price {
        ticker.price(with: currency.wrappedValue)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Text(ticker.symbol)
                    Text("-")
                    Text(price.amount, format: .currency(code: price.currency.code))
                    Spacer()
                }
                .foregroundColor(.secondary)
                Text(ticker.percentChange24Hours, format: .percent)
                    .foregroundStyle(ValueChangeStyle(value: ticker.percentChange24Hours))
                    .fontWeight(.bold)

            }
            .padding(.horizontal)
            .font(.subheadline)
        }
        .navigationTitle(ticker.name)
        .toolbar {
            SwitchCurrencyButton()
        }
    }
}

#Preview {
    NavigationStack {
        TickerDetailsView(ticker: .preview)
    }
}
