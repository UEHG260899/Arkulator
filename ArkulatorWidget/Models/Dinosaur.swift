//
//  Dinosaur.swift
//  ArkulatorWidgetExtension
//
//  Created by Uriel Hernandez Gonzalez on 20/09/23.
//

import Foundation
import RealmSwift

class Dinosaur: Object, Identifiable {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var name: String
    @Persisted var stamina: Int
    @Persisted var weight: Int
    @Persisted var oxigen: Int
    @Persisted var mele: Int
    @Persisted var food: Int
    @Persisted var movementSpeed: Int
    @Persisted var health: Int
    @Persisted var expectedLevel: Int
    @Persisted var map: ArkMap

    var requiredLevel: Int {
        return stamina + weight + oxigen + mele + food + movementSpeed + health + 1
    }

    override init() {

    }

    init(id: UUID = .init(),
         name: String,
         stamina: Int,
         weight: Int,
         oxigen: Int,
         mele: Int,
         food: Int,
         movementSpeed: Int,
         health: Int,
         map: ArkMap
    ) {
        super.init()
        self.id = id
        self.name = name.lowercased()
        self.stamina = stamina
        self.weight = weight
        self.oxigen = oxigen
        self.mele = mele
        self.food = food
        self.movementSpeed = movementSpeed
        self.health = health
        self.expectedLevel = requiredLevel
        self.map = map
    }
}

extension Dinosaur {
    static let placeholder = Dinosaur(
        name: "Rex",
        stamina: 10,
        weight: 10,
        oxigen: 10,
        mele: 10,
        food: 10,
        movementSpeed: 10,
        health: 10,
        map: .island
    )
}
