//
//  TickerRow.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

struct TickerRow: View {

    @Environment(\.currency) var currency

    let ticker: Ticker

    private var price: Price {
        ticker.price(with: currency.wrappedValue)
    }

    var body: some View {
        HStack {
            Text(ticker.name)
                .font(.headline)
            Spacer()
            Text(price.amount, format: .currency(code: price.currency.code))
        }
    }
}

#Preview {
    List {
        TickerRow(ticker: .preview)
    }
}
