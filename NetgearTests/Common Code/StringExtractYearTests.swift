//
//  StringExtractYearTests.swift
//  NetgearTests
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import XCTest
@testable import Netgear


final class StringExtractYearTests: XCTestCase {

    func testExtractYear_WithValidDate_ReturnsYear() {
        let input = "2010-01-30"
        let year = input.extractYear()
        XCTAssertEqual(year, "2010")
    }

    func testExtractYear_WithAnotherValidDate() {
        let input = "1999-12-31"
        let year = input.extractYear()
        XCTAssertEqual(year, "1999")
    }

    func testExtractYear_WithInvalidDateFormat_ReturnsNil() {
        let input = "30-01-2010"
        let year = input.extractYear()
        XCTAssertNil(year)
    }

    func testExtractYear_WithIncompleteDate_ReturnsNil() {
        let input = "2010-01"
        let year = input.extractYear()
        XCTAssertNil(year)
    }

    func testExtractYear_WithRandomString_ReturnsNil() {
        let input = "Not a date"
        let year = input.extractYear()
        XCTAssertNil(year)
    }
}
