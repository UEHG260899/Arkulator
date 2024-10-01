//
//  ArkulatorWidgetProvider.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 20/09/23.
//

import WidgetKit
import RealmSwift

struct ArkulatorWidgetProvider: TimelineProvider {

    private var realm: Realm {
        let container = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.arkulator")
        let realmUrl = container?.appendingPathComponent("default.realm")
        let config = Realm.Configuration(fileURL: realmUrl, schemaVersion: 2) { migration, oldSchemaVersion in
            migration.enumerateObjects(ofType: Dinosaur.className()) { _, newObject in
                switch oldSchemaVersion {
                case 0:
                    newObject!["id"] = UUID()
                case 1:
                    newObject!["map"] = ArkMap.island
                default:
                    print("Not supported")
                }
            }
        }
        return try! Realm(configuration: config)
    }

    private let userDefaults = UserDefaults(suiteName: "group.com.arkulator")

    func placeholder(in context: Context) -> ArkulatorWidgetEntry {
        ArkulatorWidgetEntry(date: Date(), dinosaurs: [.placeholder])
    }

    func getSnapshot(in context: Context, completion: @escaping (ArkulatorWidgetEntry) -> Void) {
        var entry: ArkulatorWidgetEntry!

        switch context.family {
        case .systemSmall:
            entry = ArkulatorWidgetEntry(date: .now, dinosaurs: [.placeholder])
        case .systemMedium:
            entry = ArkulatorWidgetEntry(date: .now, dinosaurs: Array(repeating: .placeholder, count: 4))
        default:
            debugPrint("Not implemented")
        }

        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ArkulatorWidgetEntry>) -> Void) {

        var dinoEntry: ArkulatorWidgetEntry!
        let results = realm.objects(Dinosaur.self)

        switch context.family {
        case .systemSmall:
            let dinosaur = results.first
            dinoEntry = ArkulatorWidgetEntry(date: .now, dinosaurs: [dinosaur ?? .placeholder])
        case .systemMedium:
            let dinos = Array(results.prefix(4))
            dinoEntry = ArkulatorWidgetEntry(date: .now, dinosaurs: dinos)
        default:
            debugPrint("Not supported")
        }

        let storedUpdate = userDefaults?.integer(forKey: "widgetRefreshTime")
        let nextUpdate = Calendar.current.date(byAdding: .init(minute: storedUpdate ?? 10), to: Date())!
        let timeline = Timeline(entries: [dinoEntry], policy: .after(nextUpdate))
        completion(timeline)
    }
}
