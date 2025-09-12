//
//  UIDinosaurTests.swift
//  ArkulatorTests
//
//  Created by Uriel Hernandez Gonzalez on 12/09/25.
//

@testable import Arkulator
import Testing

struct UIDinosaurTests {

    @Test func testInitFromDinosaur() async throws {
        let dinosaur = Dinosaur(name: "Anky",
                                stamina: 10,
                                weight: 10,
                                oxigen: 10,
                                mele: 10,
                                food: 10,
                                movementSpeed: 10,
                                health: 10, map: .theCenter)

        let sut = UIDinosaur(from: dinosaur)

        #expect(sut.id == dinosaur.id)
        #expect(sut.name == dinosaur.name.lowercased())
        #expect(sut.stamina == dinosaur.stamina)
        #expect(sut.weight == dinosaur.weight)
        #expect(sut.oxigen == dinosaur.oxigen)
        #expect(sut.mele == dinosaur.mele)
        #expect(sut.food == dinosaur.food)
        #expect(sut.movementSpeed == dinosaur.movementSpeed)
        #expect(sut.health == dinosaur.health)
        #expect(sut.expectedLevel == dinosaur.expectedLevel)
        #expect(sut.map == dinosaur.map)
    }

}
