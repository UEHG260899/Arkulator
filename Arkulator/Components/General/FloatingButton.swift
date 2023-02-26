//
//  FloatingButton.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 25/02/23.
//

import SwiftUI

struct FloatingButton: View {

    let action: (() -> Void)

    var body: some View {
        HStack {
            Spacer()

            Button(action: self.action, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding()
            })
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(action: {})
    }
}
