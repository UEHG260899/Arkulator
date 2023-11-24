//
//  SettingsListView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 27/08/22.
//

import SwiftUI

struct SettingsListView: View {

    @AppStorage("colorScheme") private var colorScheme: Constants.ColorSchemes = .light

    var body: some View {
        Form {
            Section {
                Picker("App color scheme", selection: $colorScheme) {
                    ForEach(Constants.ColorSchemes.allCases) { item in
                        Text(item.rawValue)
                    }
                }
            } header: {
                Text("App Visualization")
            }

            Section {
                NavigationLink(destination: FaqsView()) {
                    Text("FAQ´s")
                }
            } header: {
                Text("Information")
            }

        }
    }
}

struct SettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsListView()
    }
}
