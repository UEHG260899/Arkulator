//
//  DinosaurStatsViewModelTests.swift
//  ArkulatorTests
//
//  Created by Uriel Hernandez Gonzalez on 16/07/22.
//

import XCTest
import SwiftUI
@testable import Arkulator

class DinosaurStatsViewModelTests: XCTestCase {

    var mockRealmManager: MockRealmManager!
    var sut: DinosaurStatsViewModel!

    override func setUp() {
        super.setUp()
        mockRealmManager = MockRealmManager(taskName: self.name)
        sut = DinosaurStatsViewModel(realmManager: mockRealmManager)
    }

    override func tearDown() {
        mockRealmManager = nil
        sut = nil
        super.tearDown()
    }

    func test_onInit_formDataValues_areEmpty() {
        sut.formFields.forEach { XCTAssertTrue($0.fieldText.isEmpty) }
    }

    func test_onInit_isFormValid_isSetToFalse() {
        XCTAssertFalse(sut.isFormValid)
    }

    func test_onInit_shouldShowAlert_isSetToFalse() {
        XCTAssertFalse(sut.shouldShowAlert)
    }

    func test_onInit_dinoMap_isSetToIsland() {
        // given
        let expectedValue = ArkMap.island.rawValue

        // then
        XCTAssertEqual(sut.dinoMap.rawValue, expectedValue)
    }

    func test_onInit_navbarVisibility_isSetToVisible() {
        // Given
        let expectedVisibility: Visibility = .visible

        // Then
        XCTAssertEqual(sut.navbarVisibility, expectedVisibility)
    }

    func test_whenShouldShowAlert_isSetToTrue_navbarVisibilityIsHidden() {
        // Given
        let expectedVisibility: Visibility = .hidden

        // When
        sut.shouldShowAlert = true

        // Then
        XCTAssertEqual(sut.navbarVisibility, expectedVisibility)
    }

    func test_whenSomeFormFieldsAreEmpty_isFormValidStillReturnsFalse() {
        // when
        let mockData: [FormField] = [
            .init(fieldType: .dinoHealth, fieldLabel: "", fieldText: "Some"),
            .init(fieldType: .dinoHealth, fieldLabel: "", fieldText: "Text"),
            .init(fieldType: .dinoHealth, fieldLabel: "", fieldText: "")
        ]

        sut.formFields = mockData

        // then
        XCTAssertFalse(sut.isFormValid)
    }

    func test_whenAllFormFieldsAreEmpty_isFormValidReturnsTrue() {
        // when
        let mockData: [FormField] = [
            .init(fieldType: .dinoHealth, fieldLabel: "", fieldText: "Some"),
            .init(fieldType: .dinoHealth, fieldLabel: "", fieldText: "Text"),
            .init(fieldType: .dinoHealth, fieldLabel: "", fieldText: "Test")
        ]

        sut.formFields = mockData

        // then
        XCTAssertTrue(sut.isFormValid)
    }

    func test_whenSaveDinosaurIsCalled_callsSave_onRealmManager() {
        // when
        sut.saveDinosaur()

        // then
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.save))
    }

}
