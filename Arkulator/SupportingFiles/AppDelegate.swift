//
//  AppDelegate.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 18/07/23.
//

import RealmSwift
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
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
                config = Realm.Configuration(fileURL: realmURL, schemaVersion: 2) { [weak self] migration, oldSchemaVersion in
                    self?.migrateOldId(migration, schemaVersion: oldSchemaVersion)
                }
            } catch {
                print("Error info: \(error)")
            }
        } else {
            config = Realm.Configuration(fileURL: realmURL, schemaVersion: 2) { [weak self] migration, oldSchemaVersion in
                self?.migrateOldId(migration, schemaVersion: oldSchemaVersion)
            }
        }

        Realm.Configuration.defaultConfiguration = config
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    private func migrateOldId(_ migration: Migration, schemaVersion: UInt64) {
        migration.enumerateObjects(ofType: Dinosaur.className()) { _, newObject in
            switch schemaVersion {
            case 0:
                newObject!["id"] = UUID()
            case 1:
                newObject!["map"] = ArkMap.island
            default:
                print("Not supported")
            }
        }
    }

}
