//
//  SearchCoordinatorTests.swift
//  NetgearTests
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import XCTest
@testable import Netgear

final class SearchCoordinatorTests: XCTestCase {
    
    func testBookSelectionTriggersNavigation() {
        
        // GIVEN a SearchCoordinator with its ViewModel
        let viewModel = SearchViewVM(webservice: MockWebservice())
        let coordinator = SearchCoordinator()
        coordinator.bind(to: viewModel)

        let book = Book(id: UUID().uuidString, volumeInfo: .init(title: "title"))
        
        // WHEN a book is selected
        viewModel.selectedBook = book

        RunLoop.main.run(until: Date().addingTimeInterval(0.1))
        
        // THEN the coordinator should attempt to display the detail screen
        XCTAssertEqual(coordinator.path, [.detail(book)])
    }
}
