//
//  View+Extensions.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/09/22.
//

import SwiftUI

extension View {

    @ViewBuilder
    func tintColor(_ color: Color) -> some View {
        if #available(iOS 15, *) {
            // As of September 4th, tint is not working as expected in iOS 15
            self.tint(color)
        } else {
            self.accentColor(color)
        }
    }

    @ViewBuilder
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }

    /// Generates an alert
    /// - Parameters:
    ///   - title: Alert´s title
    ///   - description: Alert´s description
    ///   - cancelButtonText: Text to display on the cancel button
    ///   - acceptButtonText: Text to display on the accept button (If empty no accept button will appear)
    ///   - isPresented: Binding property tht shows/hides the alert
    ///   - onAcceptClicked: Action to be executed when accept button gets tapped
    /// - Returns: a View
    func arkulatorAlert(
        title: String,
        description: String? = nil,
        cancelButtonText: String,
        acceptButtonText: String? = nil,
        isPresented: Binding<Bool>,
        onAcceptClicked: (() -> Void)? = nil
    ) -> some View {
        ZStack {
            self
            ArkulatorAlert(
                title: title,
                description: description,
                cancelButtonText: cancelButtonText,
                acceptButtonText: acceptButtonText,
                isPresented: isPresented,
                onAcceptClicked: onAcceptClicked
            )
        }
    }
}
