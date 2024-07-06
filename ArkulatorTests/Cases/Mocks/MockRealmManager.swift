//
//  MockRealmManager.swift
//  ArkulatorTests
//
//  Created by Uriel Hernandez Gonzalez on 18/07/23.
//

import Foundation
import RealmSwift
@testable import Arkulator

class MockRealmManager: StorageManagerProtocol {

    struct CalledMethods: OptionSet {
        let rawValue: Int

        static let save = CalledMethods(rawValue: 1 << 0)
        static let fetch = CalledMethods(rawValue: 1 << 1)
        static let delete = CalledMethods(rawValue: 1 << 2)
        static let fetchMap = CalledMethods(rawValue: 1 << 3)
    }

    private let realm: Realm
    var calledMethods: CalledMethods = []

    init(taskName: String) {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = taskName
        self.realm = try! Realm()
    }

    func save<T: Object>(_ object: T) {
        calledMethods.insert(.save)
        try! realm.write {
            realm.add(object)
        }
    }

    func saveObjects<T: Object>(_ objects: [T]) {
        try! realm.write {
            realm.add(objects)
        }
    }

    func fetch<T: Object>(type: T.Type) -> [T] {
        calledMethods.insert(.fetch)
        return Array(realm.objects(type))
    }

    func fetch<T: Object>(type: T.Type, map: ArkMap) -> [T] {
        calledMethods.insert(.fetchMap)
        return Array(realm.objects(type).filter("map = %@", map.rawValue))
    }

    func delete<T: Object>(_ object: T) {
        calledMethods.insert(.delete)
    }
}
