//
//  TabsScreen.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 27/08/22.
//

import SwiftUI

struct TabsScreen: View {
    var body: some View {
        TabView {
            
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
            SettingsScreen()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(1)
            
        }
        .accentColor(Constants.UIColors.uiAccentColor)
    }
}

struct TabsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabsScreen()
    }
}
