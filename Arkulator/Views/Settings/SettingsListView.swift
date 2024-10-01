//
//  SettingsListView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 27/08/22.
//

import SwiftUI

struct SettingsListView: View {

    @AppStorage("colorScheme") private var colorScheme: Constants.ColorSchemes = .light
    @AppStorage("widgetRefreshTime", store: UserDefaults(suiteName: "group.com.arkulator"))
    private var widgetRefreshTime = 10

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
                Picker("Widget refresh time (In minutes)", selection: $widgetRefreshTime) {
                    Text("5")
                        .tag(5)
                    Text("10")
                        .tag(10)
                    Text("15")
                        .tag(15)
                }
            } header: {
                Text("Widgets")
            }

            Section {
                NavigationLink(destination: FaqsView()) {
                    Text("FAQ´s")
                }
            } header: {
                Text("Information")
            }

        }
        .if(colorScheme == .dark) { view in
            view
                .scrollContentBackground(.hidden)
                .background(Color.mainColor)
        }
    }
}

struct SettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsListView()
    }
}
