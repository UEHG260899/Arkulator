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
        let config = Realm.Configuration(fileURL: realmUrl)
        return try! Realm(configuration: config)
    }

    func placeholder(in context: Context) -> ArkulatorWidgetEntry {
        ArkulatorWidgetEntry(date: Date(), dinosaurs: [.placeholder])
    }

    func getSnapshot(in context: Context, completion: @escaping (ArkulatorWidgetEntry) -> Void) {
        let entry = ArkulatorWidgetEntry(date: Date(), dinosaurs: [.placeholder])
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ArkulatorWidgetEntry>) -> Void) {
        if context.family == .systemSmall {
            let dinosaur = realm.objects(Dinosaur.self).first

            let dinoEntry = ArkulatorWidgetEntry(date: Date(), dinosaurs: [dinosaur ?? .placeholder])

            let nextUpdate = Calendar.current.date(byAdding: .init(minute: 15), to: Date())!

            let timeline = Timeline(entries: [dinoEntry], policy: .after(nextUpdate))

            completion(timeline)
            return
        }
        
        let dinos = Array(realm.objects(Dinosaur.self))

        let dinoEntry = ArkulatorWidgetEntry(date: .now, dinosaurs: dinos)

        let nextUpdate = Calendar.current.date(byAdding: .init(minute: 15), to: Date())!
        let timeline = Timeline(entries: [dinoEntry], policy: .after(nextUpdate))
        completion(timeline)
    }
}
