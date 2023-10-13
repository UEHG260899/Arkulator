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
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        configureRealm()
        return true
    }

    private func configureRealm() {
        let defaultRealm = Realm.Configuration.defaultConfiguration.fileURL!
        let container = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.arkulator")
        let realmURL = container?.appendingPathComponent("default.realm")
        var config: Realm.Configuration!

        if FileManager.default.fileExists(atPath: defaultRealm.path) {
            do {
                _ = try FileManager.default.replaceItemAt(realmURL!, withItemAt: defaultRealm)
                config = Realm.Configuration(fileURL: realmURL)
            } catch {
                print("Error info: \(error)")
            }
        } else {
            config = Realm.Configuration(fileURL: realmURL)
        }

        Realm.Configuration.defaultConfiguration = config
    }
}
