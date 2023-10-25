//
//  ArkulatorAlert.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 24/10/23.
//

import SwiftUI

struct ArkulatorAlert: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 2) {
                Text("Alert title")
                    .font(.body)
                    .fontWeight(.semibold)
                Text("Description")
                    .font(.footnote)
                    .fontWeight(.regular)
            }
            .padding(20)

            Divider()

            HStack {
                // TODO: Try to delete spacers
                Spacer()
                Button(action: {}) {
                    Text("Cancel")
                        .font(.body)
                        .fontWeight(.regular)
                }
                Spacer()
                Divider()
                Spacer()
                Button(action: {}) {
                    Text("Accept")
                        .font(.body)
                        .fontWeight(.regular)
                }
                Spacer()
            }
            .frame(maxHeight: 44)
        }
        .background(.ultraThickMaterial)
        .cornerRadius(14)
        .frame(width: 270)

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
            ArkulatorAlert()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
