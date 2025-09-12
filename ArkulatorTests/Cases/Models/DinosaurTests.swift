//
//  DinosaurTests.swift
//  ArkulatorTests
//
//  Created by Uriel Hernandez Gonzalez on 12/09/25.
//

@testable import Arkulator
import Testing

struct DinosaurTests {

    @Test func testInitFromUIDino() {
        let uiDino = UIDinosaur(id: .init(),
                                name: "Anky",
                                stamina: 10,
                                weight: 10,
                                oxigen: 10,
                                mele: 10,
                                food: 10,
                                movementSpeed: 10,
                                health: 10,
                                expectedLevel: 71, // Need to be the sum of all the others + 1
                                map: .aberration)

        let sut = Dinosaur(from: uiDino)

        #expect(sut.id == uiDino.id)
        #expect(sut.name == uiDino.name.lowercased())
        #expect(sut.stamina == uiDino.stamina)
        #expect(sut.weight == uiDino.weight)
        #expect(sut.oxigen == uiDino.oxigen)
        #expect(sut.mele == uiDino.mele)
        #expect(sut.food == uiDino.food)
        #expect(sut.movementSpeed == uiDino.movementSpeed)
        #expect(sut.health == uiDino.health)
        #expect(sut.expectedLevel == uiDino.expectedLevel)
        #expect(sut.map == uiDino.map)
    }

}
