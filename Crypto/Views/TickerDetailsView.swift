//
//  TickerDetailsView.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

struct TickerDetailsView: View {

    let ticker: Ticker
    let currency: Currency

    var price: Price {
        ticker.price(with: currency)
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
                Spacer()
            }
            .padding(.horizontal)
            .font(.subheadline)
        }
        .navigationTitle(ticker.name)
    }
}

#Preview {
    NavigationStack {
        TickerDetailsView(ticker: .preview, currency: .usd)
    }
}

struct ValueChangeStyle: ShapeStyle {

    let value: Double

    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        switch value {
        case let x where x > 0:
            return Color(.systemGreen)
        case let x where x < 0:
            return Color(.systemRed)
        default:
            return Color(.secondaryLabel)
        }
    }
}
