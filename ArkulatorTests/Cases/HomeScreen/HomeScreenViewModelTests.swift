//
//  HomeScreenViewModelTests.swift
//  ArkulatorTests
//
//  Created by Uriel Hernandez Gonzalez on 05/09/22.
//

@testable import Arkulator
import XCTest

class HomeScreenViewModelTests: XCTestCase {

    var sut: HomeScreenViewModel!

    override func setUp() {
        super.setUp()
        sut = HomeScreenViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testIfHomeScreenViewModelCanBeInstanciated() {
        XCTAssertNotNil(sut)
    }

    func testIfQueryStringIsInitializedWithEmptyValue() {
        XCTAssertEqual(sut.queryString, "")
    }

}
