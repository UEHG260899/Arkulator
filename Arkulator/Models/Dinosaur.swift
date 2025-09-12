//
//  Dinosaur.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
//

import Foundation
import RealmSwift

final class Dinosaur: Object, Identifiable {
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

    override init() {}

    init(
        id: UUID = UUID(),
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

    init(from: UIDinosaur) {
        super.init()
        self.id = from.id
        self.name = from.name.lowercased()
        self.stamina = from.stamina
        self.weight = from.weight
        self.oxigen = from.oxigen
        self.mele = from.mele
        self.food = from.food
        self.movementSpeed = from.movementSpeed
        self.health = from.health
        self.expectedLevel = requiredLevel
        self.map = from.map
    }

}
