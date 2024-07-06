//
//  RealmManager.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 16/07/23.
//

import Foundation
import RealmSwift

struct RealmManager: StorageManagerProtocol {
    private let realm = try! Realm()

    func save<T: Object>(_ object: T) {
        try! realm.write {
            guard T.primaryKey() != nil else {
                realm.add(object, update: .modified)
                return
            }

            realm.add(object)
        }
    }

    func fetch<T: Object>(type: T.Type) -> [T] {
        return Array(realm.objects(type))
    }

    func fetch<T: Object>(type: T.Type, map: ArkMap) -> [T] {
        return Array(realm.objects(type).filter("map = %@", map.rawValue))
    }

    func delete<T: Object>(_ object: T) {
        try! realm.write {
            realm.delete(object)
        }
    }
}
