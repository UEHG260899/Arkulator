//
//  RoundedButton.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 25/02/23.
//

import SwiftUI

struct RoundedButton: View {

    let text: String
    let isDisabled: Bool
    let action: (() -> Void)
    var scheme: RoundedButtonScheme = RoundedButtonScheme()

    var body: some View {
        Button(action: self.action) {
            Text(text)
                .font(scheme.labelFont)
                .foregroundColor(scheme.labelForegroundColor)
                .fontWeight(scheme.fontWeight)
                .padding()
                .frame(maxWidth: .infinity)
        }
        .disabled(isDisabled)
        .background(scheme.backgroundColor)
        .clipShape(Capsule())
        .if(scheme.horizontalPadding != nil) { view in
            view.padding(.horizontal, scheme.horizontalPadding)
        }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(text: "Save", isDisabled: false, action: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

struct RoundedButtonScheme {
    // Button Styles
    var backgroundColor: Color = .uiAccentColor
    var horizontalPadding: CGFloat?

    // Label Styles
    var labelFont: Font = .title3
    var labelForegroundColor: Color = .white
    var fontWeight: Font.Weight = .bold
}
