//
//  Dinosaur.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 05/07/22.
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
    
    private var requiredLevel: Int {
        return stamina + weight + oxigen + mele + food + movementSpeed + health + 1
    }
    
    override init() {
        
    }
    
    init(name: String,
         stamina: Int,
         weight: Int,
         oxigen: Int,
         mele: Int,
         food: Int,
         movementSpeed: Int,
         health: Int) {
        super.init()
        self.id = incrementID()
        self.name = name
        self.stamina = stamina
        self.weight = weight
        self.oxigen = oxigen
        self.mele = mele
        self.food = food
        self.movementSpeed = movementSpeed
        self.health = health
        self.expectedLevel = requiredLevel
    }
    
    func save() {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(self)
        }
    }
    
    private func incrementID() -> Int64 {
        let realm = try! Realm()
        return (realm.objects(Dinosaur.self).max(ofProperty: "id") as Int64? ?? 0) + 1
    }
}
