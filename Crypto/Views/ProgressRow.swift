//
//  ProgressRow.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

struct ProgressRow: View {
    var body: some View {
        VStack(alignment: .center) {
            ProgressView()
        }
        .frame(maxWidth: .infinity)
        .listRowBackground(Color(uiColor: .systemGroupedBackground))
    }
}

#Preview {
    List {
        ProgressRow()
    }
}
