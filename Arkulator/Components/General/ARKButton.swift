//
//  ARKButton.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 01/08/23.
//

import SwiftUI

struct ARKButton: View {

    let labelText: String
    let isDisabled: Bool
    var scheme: ARKButtonScheme = .init()
    let action: (() -> Void)

    private var backgroundColor: Color {
        guard isDisabled else {
            return scheme.backgroundColor
        }

        return scheme.backgroundColor.opacity(0.5)
    }

    var body: some View {
        Button(action: action) {
            Text(labelText)
                .font(scheme.font)
                .fontWeight(scheme.fontWeight)
                .foregroundColor(scheme.fontForegroundColor)
                .padding()
                .frame(maxWidth: .infinity)
        }
        .disabled(isDisabled)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: scheme.cornerRadius))
        .animation(.easeOut, value: isDisabled)
    }
}

struct ARKButton_Previews: PreviewProvider {

    static let devices = ["iPhone SE (3rd generation)", "iPhone 11", "iPhone 14 Pro Max"]

    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            ARKButton(labelText: "Save", isDisabled: true, action: {})
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
