//
//  Currency.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import Foundation

enum Currency: Hashable {
    case bitcoin
    case dollar

    var code: String {
        switch self {
        case .bitcoin:
            return "btc"
        case .dollar:
            return "usd"
        }
    }
}
