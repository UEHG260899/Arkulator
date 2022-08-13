//
//  EditDinosaurViewModelTests.swift
//  ArkulatorTests
//
//  Created by Uriel Hernandez Gonzalez on 16/07/22.
//

import XCTest
@testable import Arkulator

class EditDinosaurViewModelTests: XCTestCase {
    
    var sut: EditDinosaurViewModel!
    var dinosaur: Dinosaur!
    
    override func setUp() {
        super.setUp()
        dinosaur = Dinosaur(name: "Argentavis",
                            stamina: 10,
                            weight: 10,
                            oxigen: 10,
                            mele: 10,
                            food: 10,
                            movementSpeed: 10,
                            health: 10)
        sut = EditDinosaurViewModel(dinosaur: dinosaur)
    }
    
    override func tearDown() {
        sut = nil
        dinosaur = nil
        super.tearDown()
    }
    
    func testEditDinosaurViewModelCanBeInstanciatedWithDinosaur() {
        XCTAssertNotNil(sut)
    }
    
    func testIfDinosaurNameIsAssignedWhenInstanciated() {
        // given
        let expectedValue = dinosaur.name.capitalized
        
        // then
        XCTAssertEqual(sut.dinosaurName, expectedValue)
    }
    
    func testIfDinosaurStatsAreAssignedWhenInstanciated() {
        // given
        let expectedStamina = String(dinosaur.stamina)
        let expectedWeight = String(dinosaur.weight)
        let expectedOxigen = String(dinosaur.oxigen)
        let expectedMele = String(dinosaur.mele)
        let expectedFood = String(dinosaur.food)
        let expectedMovementSpeed = String(dinosaur.movementSpeed)
        let expectedHealth = String(dinosaur.health)
        
        // then
        XCTAssertEqual(sut.dinosaurStamina, expectedStamina)
        XCTAssertEqual(sut.dinosaurWeight, expectedWeight)
        XCTAssertEqual(sut.dinosaurOxigen, expectedOxigen)
        XCTAssertEqual(sut.dinosaurMele, expectedMele)
        XCTAssertEqual(sut.dinosaurFood, expectedFood)
        XCTAssertEqual(sut.dinosaurMovementSpeed, expectedMovementSpeed)
        XCTAssertEqual(sut.dinosaurHealth, expectedHealth)
    }
    
    func testIfFormIsValidWhenInstanciated() {
        XCTAssertTrue(sut.isFormValid)
    }
    
    func testIfFormIsNotValidWhenNotAllStatsAreSet() {
        // given
        sut.dinosaurName = ""
        
        // then
        XCTAssertFalse(sut.isFormValid)
    }
    

}
