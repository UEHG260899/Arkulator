//
//  AppDelegate.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 18/07/23.
//

import Foundation
import RealmSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        return true
    }
}
