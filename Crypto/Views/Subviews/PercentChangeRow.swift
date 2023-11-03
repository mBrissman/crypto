//
//  PercentChangeRow.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-11-03.
//

import SwiftUI

struct PercentChangeRow: View {

    let titleKey: LocalizedStringKey
    let change: Double

    init(_ titleKey: LocalizedStringKey, change: Double) {
        self.titleKey = titleKey
        self.change = change
    }

    var body: some View {
        HStack {
            Text(titleKey)
            Spacer()
            Text(change, format: .percent)
                .foregroundStyle(.valueChange(for: change))
                .fontWeight(.bold)
            symbol
        }
    }

    @ViewBuilder
    private var symbol: some View {
        Group {
            switch change {
            case let x where x > 0:
                Image(systemName: "chevron.up.square.fill")
            case let x where x < 0:
                Image(systemName: "chevron.down.square.fill")
            default:
                Image(systemName: "dot.square.fill")

            }
        }
        .foregroundStyle(.valueChange(for: change))
    }
}

#Preview {
    VStack {
        PercentChangeRow("Change", change: 0.234)
        PercentChangeRow("Change", change: 0)
        PercentChangeRow("Change", change: -0.045)
    }
}
