//
//  ErrorAlertModifier.swift
//  Crypto
//
//  Created by Marcus Brissman on 2023-11-03.
//

import SwiftUI

struct ErrorAlertModifier: ViewModifier {

    let error: Error?
    @Binding var isPresented: Bool

    func body(content: Content) -> some View {
        content
            .alert(
                "Error",
                isPresented: $isPresented,
                actions: actions,
                message: { message(for: error) }
            )
    }

    private func actions() -> some View {
        Button(role: .cancel, action: {}, label: { Text("Close") })
    }

    private func message(for error: Error?) -> some View {
        Text(error?.localizedDescription ?? "Something went wrong")
    }
}

extension View {
    func errorAlert(error: Error?, isPresented: Binding<Bool>) -> some View {
        self.modifier(ErrorAlertModifier(error: error, isPresented: isPresented))
    }
}
