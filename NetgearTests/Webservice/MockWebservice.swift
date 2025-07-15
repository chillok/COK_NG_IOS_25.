//
//  MockWebservice.swift
//  NetgearTests
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import Foundation
@testable import Netgear

class MockWebservice: WebserviceProtocol {
    
    var retrieveBooksCalled = false
    var retrieveBooksResult = BookResponse(items: [])
    func retrieveBooks(query: String) async throws -> BookResponse {
        retrieveBooksCalled = true
        return retrieveBooksResult
    }
    
    var dataCalled = false
    var dataResult = Data()
    func data(for request: URLRequest) async throws -> Data {
        dataCalled = true
        return dataResult
    }
}
