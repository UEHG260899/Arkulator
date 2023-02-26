//
//  DinosaurStatsViewModelTests.swift
//  ArkulatorTests
//
//  Created by Uriel Hernandez Gonzalez on 16/07/22.
//

import XCTest
@testable import Arkulator

class DinosaurStatsViewModelTests: XCTestCase {

    var sut: DinosaurStatsViewModel!

    override func setUp() {
        super.setUp()
        sut = DinosaurStatsViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testFormIsNotValidWhenAllDinosaurPropertiesAreEmpty() {
        XCTAssert(sut.isFormValid == false, "isFormValid should be false at the start")
    }

    func testFormIsNotValidWhenSomeDinosaurPropertiesAreSet() {
        sut.dinosaurName = "Argentavis"
        sut.dinosaurStamina = "10"
        sut.dinosaurWeight = "10"

        XCTAssert(sut.isFormValid == false, "isFormValid should be false if not all properties are set")
    }

    func testFormIsValidWhenAllDinosaurPropertiesAreSet() {
        sut.dinosaurName = "Argentavis"
        sut.dinosaurStamina = "10"
        sut.dinosaurWeight = "10"
        sut.dinosaurOxigen = "10"
        sut.dinosaurMele = "10"
        sut.dinosaurFood = "10"
        sut.dinosaurMovementSpeed = "10"
        sut.dinosaurHealth = "10"

        XCTAssert(sut.isFormValid == true, "isFormValid should be true when all properties are set")
    }

    func testDinosaurExpectedLevelShouldBeStatsSumPlusOne() {
        let dinosaur = Dinosaur(name: "Argentavis",
                                stamina: 10,
                                weight: 10,
                                oxigen: 10,
                                mele: 10,
                                food: 10,
                                movementSpeed: 10,
                                health: 10)

        XCTAssert(dinosaur.requiredLevel == 71, "requiredLevel should be equals to stats summatory plus one")
    }

}
