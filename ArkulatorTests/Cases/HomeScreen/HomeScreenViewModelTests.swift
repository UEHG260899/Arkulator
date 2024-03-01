//
//  HomeScreenViewModelTests.swift
//  ArkulatorTests
//
//  Created by Uriel Hernandez Gonzalez on 05/09/22.
//

@testable import Arkulator
import XCTest
import SwiftUI

class HomeScreenViewModelTests: XCTestCase {

    var sut: HomeScreenViewModel!
    var mockRealmManager: MockRealmManager!

    let mockDinosaurs: [Dinosaur] = [
        .init(
            id: UUID(),
            name: "Argie",
            stamina: 10,
            weight: 10,
            oxigen: 10,
            mele: 10,
            food: 10,
            movementSpeed: 10,
            health: 10,
            map: .island
        ),
        .init(
            id: UUID(),
            name: "Spyino",
            stamina: 20,
            weight: 20,
            oxigen: 20,
            mele: 20,
            food: 20,
            movementSpeed: 20,
            health: 20,
            map: .island
        ),
        .init(
            id: UUID(),
            name: "Anky",
            stamina: 39,
            weight: 39,
            oxigen: 39,
            mele: 39,
            food: 39,
            movementSpeed: 39,
            health: 39,
            map: .island
        )
    ]

    override func setUp() {
        super.setUp()
        mockRealmManager = MockRealmManager(taskName: self.name)
        sut = HomeScreenViewModel(realmManager: mockRealmManager)
    }

    override func tearDown() {
        mockRealmManager = nil
        sut = nil
        super.tearDown()
    }

    func testIfHomeScreenViewModelCanBeInstanciated() {
        XCTAssertNotNil(sut)
    }

    func testIfQueryStringIsInitializedWithEmptyValue() {
        XCTAssertEqual(sut.queryString, "")
    }

    func test_onInit_dinosaursArray_isEmpty() {
        XCTAssertTrue(sut.dinosaurs.isEmpty)
    }

    func test_onInit_showError_isSetToFalse() {
        XCTAssertFalse(sut.showError)
    }

    func test_onInit_navbarVisibility_isVisible() {
        // Given
        let expectedVisibility: Visibility = .visible

        // Then
        XCTAssertEqual(sut.navbarVisibility, expectedVisibility)
    }

    func test_whenShowErrorIsTrue_navbarVisibility_isHidden() {
        // given
        let expectedVisibility: Visibility = .hidden

        // when
        sut.showError = true

        // then
        XCTAssertEqual(sut.navbarVisibility, expectedVisibility)
    }

    func test_whenFetchDinosaursIsCalled_itCallsFetch_onRealmManager() {
        // when
        sut.fetchDinosaurs()

        // then
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.fetch))
    }

    func test_whenFetchDinosaursIsCalled_andThereAreDinosaursInCache_vmDinosaursGetUpdated() {
        // given
        let mockDinosaur = Dinosaur(name: "Argie", stamina: 10, weight: 10, oxigen: 10, mele: 10, food: 10, movementSpeed: 10, health: 10, map: .island)
        mockRealmManager.save(mockDinosaur)

        // when
        sut.fetchDinosaurs()

        // then
        XCTAssertEqual(sut.dinosaurs.count, 1)
    }

    func test_whenFilterDinosaursIsCalled_andQueryStringIsEmpty_setsAllDinosaurs_andCallsFetchOnRealManager() {
        // given
        let testQuery = ""

        mockRealmManager.saveObjects(mockDinosaurs)

        // when
        sut.filterDinosaurs(query: testQuery)

        // then
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.fetch))
        XCTAssertEqual(sut.dinosaurs.count, mockDinosaurs.count)
    }

    func test_whenFilterDinosaursIsCalled_andQueryStringIsNotEmpty_setsFilteredDinos() {
        // given
        let testQuery = "Arg"

        mockRealmManager.saveObjects(mockDinosaurs)
        sut.fetchDinosaurs()

        // when
        sut.filterDinosaurs(query: testQuery)

        // then
        XCTAssertEqual(sut.dinosaurs.count, 1)
        XCTAssertEqual(sut.dinosaurs.first?.name, mockDinosaurs.first?.name)
    }

    func test_whenDeleteDinosaurIsCalled_andNoDinosaurIsFoundAtIndex_itDoesntCallDelete_onRealmManager() {
        // given
        let testIndex = IndexSet(integer: 4)
        mockRealmManager.saveObjects(mockDinosaurs)
        sut.fetchDinosaurs()

        // when
        sut.deleteDinosaur(at: testIndex)

        // then
        XCTAssertFalse(mockRealmManager.calledMethods.contains(.delete))
    }

    func test_whenDeletewhenDeleteDinosaurIsCalled_andNoDinosaurIsFoundAtIndex_callsFetchOnRealmManager() {
        // given
        let testIndex = IndexSet(integer: 4)
        mockRealmManager.saveObjects(mockDinosaurs)
        sut.fetchDinosaurs()

        // when
        sut.deleteDinosaur(at: testIndex)

        // then
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.fetch))
    }

    func test_whenDeleteDinosaurIsCalled_andNoDinosaurIsFoundAtIndex_changesShowError_toTrue() {
        // given
        let testIndex = IndexSet(integer: 4)
        mockRealmManager.saveObjects(mockDinosaurs)
        sut.fetchDinosaurs()

        // when
        sut.deleteDinosaur(at: testIndex)

        // then
        XCTAssertTrue(sut.showError)
    }

    func test_whenDeleteDinosaurIsCalled_andDinosaurIsFoundAtIndex_callsDeleteAndFetchOnRealmManager() {
        let testIndex = IndexSet(integer: 2)
        mockRealmManager.saveObjects(mockDinosaurs)
        sut.fetchDinosaurs()

        // when
        sut.deleteDinosaur(at: testIndex)

        // then
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.delete))
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.fetch))
    }

    func test_whenFilterByMapIsCalled_callsFetchOnRealmManager_ifMapIsSetToAll() {
        // given
        mockRealmManager.saveObjects(mockDinosaurs)

        // when
        sut.filerBy(map: .all)

        // then
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.fetch))
    }

    func test_whenFilterByMapIsCalled_callsFetchByMapOnRealmManager_ifMapIsDifferentFromAll() {
        // given
        mockRealmManager.saveObjects(mockDinosaurs)

        // when
        sut.filerBy(map: .island)

        // then
        XCTAssertTrue(mockRealmManager.calledMethods.contains(.fetchMap))
    }
}
