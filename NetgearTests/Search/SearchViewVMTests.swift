//
//  SearchViewVMTests.swift
//  NetgearTests
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import XCTest
@testable import Netgear

final class SearchViewVMTests: XCTestCase {
    
    var webservice: MockWebservice!
    var viewModel: SearchViewVM!

    override func setUpWithError() throws {
        webservice = MockWebservice()
    }

    func testBooksRetrievalCalled() throws {
        
        // GIVEN a search view model with blank state
        viewModel = SearchViewVM(webservice: webservice)
        
        // WHEN we request the books from the view model
        viewModel.search(for: "mybook")
        
        eventually {
            // THEN the webservice should attempt to retrieve them
            XCTAssertTrue(self.webservice.retrieveBooksCalled)
        }
    }
}
