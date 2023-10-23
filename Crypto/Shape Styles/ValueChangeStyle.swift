//
//  ValueChangeStyle.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-10-23.
//

import SwiftUI

/// Style based on if the value is negative, positive or neutral.
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
