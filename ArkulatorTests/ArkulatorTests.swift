//
//  ArkulatorTests.swift
//  ArkulatorTests
//
//  Created by Uriel Hernandez Gonzalez on 09/07/22.
//

import XCTest

@testable import Arkulator

class ArkulatorTests: XCTestCase {

    var dinoViewModel: DinosaurStatsViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        dinoViewModel = DinosaurStatsViewModel()
    }

    override func tearDownWithError() throws {
        dinoViewModel = nil
        try super.tearDownWithError()
    }

    func testFormIsNotValidWhenAllDinosaurPropertiesAreEmpty() {
        XCTAssert(dinoViewModel.isFormValid == false, "isFormValid should be false at the start")
    }
    
    func testFormIsNotValidWhenSomeDinosaurPropertiesAreSet() {
        dinoViewModel.dinosaurName = "Argentavis"
        dinoViewModel.dinosaurStamina = "10"
        dinoViewModel.dinosaurWeight = "10"
        
        XCTAssert(dinoViewModel.isFormValid == false, "isFormValid should be false if not all properties are set")
    }
    
    func testFormIsValidWhenAllDinosaurPropertiesAreSet() {
        dinoViewModel.dinosaurName = "Argentavis"
        dinoViewModel.dinosaurStamina = "10"
        dinoViewModel.dinosaurWeight = "10"
        dinoViewModel.dinosaurOxigen = "10"
        dinoViewModel.dinosaurMele = "10"
        dinoViewModel.dinosaurFood = "10"
        dinoViewModel.dinosaurMovementSpeed = "10"
        dinoViewModel.dinosaurHealth = "10"
        
        XCTAssert(dinoViewModel.isFormValid == true, "isFormValid should be true when all properties are set")
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
