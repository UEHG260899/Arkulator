//
//  ArkulatorAlert.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 24/10/23.
//

import SwiftUI

private enum Scheme {
    static let mainSpacing = 0.0
    static let spacingBetweenTexts = 2.0
    static let textsPadding = 20.0
    static let buttonsMaxHeight = 44.0
    static let alertBackground = Material.ultraThickMaterial
    static let alertCornerRadius = 14.0
    static let alertWidth = 270.0
    static let alertAnimation = Animation.linear(duration: 0.15)
}

struct ArkulatorAlert: View {

    let title: String
    var description: String?
    let cancelButtonText: String
    var acceptButtonText: String?
    @Binding var isPresented: Bool
    var onAcceptClicked: (() -> Void)?

    @State private var opacity = 0.0

    private var alertDescription: String {
        description ?? ""
    }

    private var acceptButtonDescription: String {
        acceptButtonText ?? ""
    }

    var body: some View {
        ZStack {

            Color.black
                .opacity(0.5)
                .ignoresSafeArea()

            VStack(spacing: Scheme.mainSpacing) {
                VStack(spacing: Scheme.spacingBetweenTexts) {
                    Text(title)
                        .font(.body)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)

                    Text(alertDescription)
                        .font(.footnote)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .isShowing(if: !alertDescription.isEmpty)
                }
                .padding(Scheme.textsPadding)

                Divider()

                HStack {
                    Button {
                        isPresented = false
                    } label: {
                        Text(cancelButtonText)
                            .font(.body)
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }

                    Divider()

                    Button {
                        onAcceptClicked?()
                    } label: {
                        Text(acceptButtonDescription)
                            .font(.body)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .isShowing(if: !acceptButtonDescription.isEmpty)
                }
                .frame(maxHeight: Scheme.buttonsMaxHeight)

            }
            .background(Scheme.alertBackground)
            .cornerRadius(Scheme.alertCornerRadius)
            .frame(width: Scheme.alertWidth)

        }
        .opacity(opacity)
        .onChange(of: isPresented) { newValue in
            opacity = newValue ? 1 : 0
        }
        .animation(Scheme.alertAnimation, value: opacity)
    }
}

struct ArkulatorAlort_Previews: PreviewProvider {
    static let devices = [
        "iPhone SE (3rd generation)",
        "iPhone 11",
        "iPhone 14 Pro Max"
    ]

    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            ArkulatorAlert(
                title: "Alert title",
                description: "joesjfopefopesjfopesjfposejfopsefopesjfopesjfo",
                cancelButtonText: "Cancel",
                acceptButtonText: "Accept",
                isPresented: .constant(true)
            )
            .previewDevice(PreviewDevice(rawValue: device))
            .previewDisplayName(device)
        }
    }
}
