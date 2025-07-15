//
//  MockDataWebService.swift
//  NetgearTests
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import Foundation
@testable import Netgear

/// Used to override the URLSession retrieval when testing our webservice
class MockDataWebservice: Webservice {
    
    var dataCalled = false
    var dataResult = Data()
    override func data(for request: URLRequest) async throws -> Data {
        dataCalled = true
        return dataResult
    }
}
