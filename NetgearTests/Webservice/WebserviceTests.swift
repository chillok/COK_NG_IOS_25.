//
//  WebserviceTests.swift
//  NetgearTests
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import XCTest
@testable import Netgear

final class WebserviceTests: XCTestCase {
    
    var webservice: MockDataWebservice!
    
    override func setUpWithError() throws {
        
        webservice = MockDataWebservice()
    }
    
    func testBooksRetrieval() async throws {
        
        // GIVEN a webservice with book resources
        let url = Bundle(for: WebserviceTests.self).url(forResource: "books", withExtension: "json")!
        let data = try Data(contentsOf: url)
        webservice.dataResult = data
        
        // WHEN we request a book resource
        
        let response = try await webservice.retrieveBooks(query: "hello")
        
        // THEN we should retrieve all the book resources
        XCTAssertEqual(response.items.count, 10)
    }
    
    func testBooksDecoding() async throws {
        
        // GIVEN a webservice with book resources
        let url = Bundle(for: WebserviceTests.self).url(forResource: "books", withExtension: "json")!
        let data = try Data(contentsOf: url)
        webservice.dataResult = data
        
        // WHEN we request a book resource
        
        let response = try await webservice.retrieveBooks(query: "hello")
        
        // THEN the book resources should be decoded correctly
        
        XCTAssertEqual(response.items[0].id, "1L-jEAAAQBAJ")
        XCTAssertEqual(response.items[0].volumeInfo.authors, ["George Orwell"])
        XCTAssertEqual(response.items[0].volumeInfo.title, "Nineteen eighty-four")
        
        XCTAssertEqual(response.items[5].id, "iuUCAAAAMBAJ")
        XCTAssertEqual(response.items[5].volumeInfo.authors, nil)
        XCTAssertEqual(response.items[5].volumeInfo.title, "New York Magazine")
        
        XCTAssertEqual(response.items[9].id, "mjVBwoknZo4C")
        XCTAssertEqual(response.items[9].volumeInfo.authors, nil)
        XCTAssertEqual(response.items[9].volumeInfo.title, "Ebony")
    }
}
