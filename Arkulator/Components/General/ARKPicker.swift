//
//  ARKPicker.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 31/10/23.
//

import SwiftUI

struct ARKPicker: View {

    @State private var selectedMap: ArkMap = .island

    var body: some View {
        HStack {
            Text("Map: ")
                .foregroundStyle(Color.textFieldColor)

            Picker("", selection: $selectedMap) {
                ForEach(ArkMap.allCases) { map in
                    Text(map.stringRepresentation.capitalized)
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
    ARKPicker()
}
