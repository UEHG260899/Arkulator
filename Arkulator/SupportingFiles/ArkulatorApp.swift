//
//  ArkulatorApp.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI

@main
struct ArkulatorApp: App {

    @AppStorage("colorScheme") private var colorScheme: Constants.ColorSchemes = .light
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var systemColorScheme: ColorScheme? {
        if colorScheme == .light {
            return .light
        }

        return .dark
    }

    var body: some Scene {
        WindowGroup {
            TabsScreen()
                .preferredColorScheme(systemColorScheme)
        }
    }
}
