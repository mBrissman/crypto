//
//  GroupedBackgroundStyle.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-11-03.
//

import SwiftUI

struct GroupedBackgroundStyle: ShapeStyle {

    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        Color(uiColor: .systemGroupedBackground)
    }
}

extension ShapeStyle where Self == GroupedBackgroundStyle {
    static var groupedBackground: GroupedBackgroundStyle { GroupedBackgroundStyle() }
}
