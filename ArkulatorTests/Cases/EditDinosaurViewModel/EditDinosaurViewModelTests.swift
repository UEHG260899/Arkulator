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
    var mockRealmManager: MockRealmManager!

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
        mockRealmManager = MockRealmManager(taskName: self.name)
        sut = EditDinosaurViewModel(dinosaur: dinosaur, realmManager: mockRealmManager)
    }

    override func tearDown() {
        sut = nil
        dinosaur = nil
        mockRealmManager = nil
        super.tearDown()
    }

    func test_onInit_formDataValues_areSet_accordingToDinosaur() {
        XCTAssertEqual(sut.formData[safe: 0]?.fieldText, dinosaur.name.capitalized)
        XCTAssertEqual(sut.formData[safe: 1]?.fieldText, String(dinosaur.stamina))
        XCTAssertEqual(sut.formData[safe: 2]?.fieldText, String(dinosaur.weight))
        XCTAssertEqual(sut.formData[safe: 3]?.fieldText, String(dinosaur.oxigen))
        XCTAssertEqual(sut.formData[safe: 4]?.fieldText, String(dinosaur.mele))
        XCTAssertEqual(sut.formData[safe: 5]?.fieldText, String(dinosaur.food))
        XCTAssertEqual(sut.formData[safe: 6]?.fieldText, String(dinosaur.movementSpeed))
        XCTAssertEqual(sut.formData[safe: 7]?.fieldText, String(dinosaur.health))
    }

    func test_onInit_isFormValid_returnsTrue() {
        XCTAssertTrue(sut.isFormValid)
    }

    func test_onInit_shouldShowAlert_isFalse() {
        XCTAssertFalse(sut.shouldShowAlert)
    }

    func test_whenOneOrMoreFormFieldsAreEmpty_isFormValid_returnsFalse() {
        // when
        sut.formData[0].fieldText = ""

        // then
        XCTAssertFalse(sut.isFormValid)
    }

    func test_whenUpdateDinosaurIsCalled_callsSave_onRealmManager() {
        // when
        sut.updateDinosaur()

        // then
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.save))
    }
}
