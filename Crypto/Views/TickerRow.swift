//
//  TickerRow.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

struct TickerRow: View {

    let ticker: Ticker

    var body: some View {
        HStack {
            Text(ticker.name)
                .font(.headline)
            Spacer()
            Text(ticker.price, format: .currency(code: "usd"))
        }
    }
}

#Preview {
    List {
        TickerRow(ticker: .preview)
    }
}
