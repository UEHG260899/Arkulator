//
//  ArkulatorAlert.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 24/10/23.
//

import SwiftUI

struct ArkulatorAlert: View {

    let title: String
    var description: String?
    let cancelButtonText: String
    var acceptButtonText: String?
    @Binding var isPresented: Bool
    var onAcceptClicked: (() -> Void)?

    @State private var opacity = 0.0

    var body: some View {
        ZStack {

            Color.black
                .opacity(0.5)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                VStack(spacing: 2) {
                    Text(title)
                        .font(.body)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)

                    if let description {
                        Text(description)
                            .font(.footnote)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(20)

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

                    if let acceptButtonText {
                        Button {
                            onAcceptClicked?()
                        } label: {
                            Text(acceptButtonText)
                                .font(.body)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }

                }
                .frame(maxHeight: 44)
            }
            .background(.ultraThickMaterial)
            .cornerRadius(14)
            .frame(width: 270)
        }
        .opacity(opacity)
        .onChange(of: isPresented) { newValue in
            opacity = newValue ? 1 : 0
        }
        .animation(.linear(duration: 0.15), value: opacity)
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
