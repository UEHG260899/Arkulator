//
//  ARKTextField.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 22/07/23.
//

import SwiftUI

struct ARKTextField: View {

    @Binding var text: String
    @FocusState var isFocused: Bool
    let placeholder: String
    var scheme: ARKTextFieldScheme = .init()
    var keyboardType: UIKeyboardType = .default

    var yOffset: CGFloat {
        switch (isFocused, text.isEmpty) {
        case (true, _):
            return -28
        case (false, false):
            return -28
        default:
            return 0
        }
    }

    var body: some View {
        ZStack(alignment: scheme.zStackAlignment) {
            TextField("", text: $text)
                .focused($isFocused)
                .keyboardType(keyboardType)

            Text(placeholder)
                .foregroundColor(scheme.placeholderForegroundColor)
                .background(scheme.placeholderBackgroundColor)
                .offset(y: yOffset)
                .onTapGesture(perform: changeFocusState)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: scheme.cornerRadius)
                .stroke(scheme.strokeColor)
        }
        .if(scheme.horizontalPadding != nil) { view in
            view.padding(.horizontal, scheme.horizontalPadding)
        }
        .animation(.easeIn(duration: scheme.animationDuration), value: yOffset)
    }
}

private extension ARKTextField {
    func changeFocusState() {
        guard yOffset == 0 else {
            return
        }

        isFocused = true
    }
}

#if DEBUG
struct ARKTextField_Previews: PreviewProvider {
    static let devices = ["iPhone SE (3rd generation)", "iPhone 11", "iPhone 14 Pro Max"]

    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            ARKTextField(text: .constant(""), placeholder: "Stamina", scheme: .init(horizontalPadding: 12))
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
#endif
