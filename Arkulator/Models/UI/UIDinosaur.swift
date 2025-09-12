//
//  UIDinosaur.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 12/09/25.
//

import Foundation

struct UIDinosaur: Identifiable, Equatable {
    let id: UUID
    let name: String
    let stamina: Int
    let weight: Int
    let oxigen: Int
    let mele: Int
    let food: Int
    let movementSpeed: Int
    let health: Int
    let expectedLevel: Int
    let map: ArkMap

    init(from dinosaur: Dinosaur) {
        self.id = dinosaur.id
        self.name = dinosaur.name.lowercased()
        self.stamina = dinosaur.stamina
        self.weight = dinosaur.weight
        self.oxigen = dinosaur.oxigen
        self.mele = dinosaur.mele
        self.food = dinosaur.food
        self.movementSpeed = dinosaur.movementSpeed
        self.health = dinosaur.health
        self.expectedLevel = stamina + weight + oxigen + mele + food + movementSpeed + health + 1
        self.map = dinosaur.map
    }

}
