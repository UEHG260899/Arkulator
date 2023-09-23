//
//  Dinosaur.swift
//  ArkulatorWidgetExtension
//
//  Created by Uriel Hernandez Gonzalez on 20/09/23.
//

import Foundation
import RealmSwift

class Dinosaur: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int64
    @Persisted var name: String
    @Persisted var stamina: Int
    @Persisted var weight: Int
    @Persisted var oxigen: Int
    @Persisted var mele: Int
    @Persisted var food: Int
    @Persisted var movementSpeed: Int
    @Persisted var health: Int
    @Persisted var expectedLevel: Int

    var requiredLevel: Int {
        return stamina + weight + oxigen + mele + food + movementSpeed + health + 1
    }

    override init() {

    }

    init(id: Int64 = 0,
         name: String,
         stamina: Int,
         weight: Int,
         oxigen: Int,
         mele: Int,
         food: Int,
         movementSpeed: Int,
         health: Int) {
        super.init()
        // TODO: Make it a UUID and remove autoincrement
        self.id = id != 0 ? id : incrementID()
        self.name = name.lowercased()
        self.stamina = stamina
        self.weight = weight
        self.oxigen = oxigen
        self.mele = mele
        self.food = food
        self.movementSpeed = movementSpeed
        self.health = health
        self.expectedLevel = requiredLevel
    }

    private func incrementID() -> Int64 {
        let realm = try! Realm()
        return (realm.objects(Dinosaur.self).max(ofProperty: "id") as Int64? ?? 0) + 1
    }
}
