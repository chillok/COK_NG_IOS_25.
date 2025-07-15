//
//  StringExtensionsTests.swift
//  NetgearTests
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import XCTest
@testable import Netgear

final class StringExtensionsTests: XCTestCase {

    func testAsSecureURL_ConvertsHttpToHttps() {
        let input = "http://example.com"
        let result = input.asSecureURL
        XCTAssertEqual(result?.absoluteString, "https://example.com")
    }

    func testAsSecureURL_KeepsHttpsAsIs() {
        let input = "https://example.com"
        let result = input.asSecureURL
        XCTAssertEqual(result?.absoluteString, "https://example.com")
    }
}
