//
//  ARKPicker.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 31/10/23.
//

import SwiftUI

struct ARKPicker: View {

    @Binding var selectedMap: ArkMap

    var body: some View {
        HStack {
            Text("Map: ")
                .foregroundStyle(Color.textFieldColor)

            Picker("", selection: $selectedMap) {
                ForEach(ArkMap.choosableMaps) { map in
                    Text(map.rawValue)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.textFieldColor)
        }
    }
}

#Preview {
    ARKPicker(selectedMap: .constant(.island))
}
