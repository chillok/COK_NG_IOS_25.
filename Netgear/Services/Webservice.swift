//
//  Webservice.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 14/07/2025.
//

import Foundation

protocol WebserviceProtocol {
    
    func retrieveBooks(query: String) async throws -> BookResponse
    func data(for request: URLRequest) async throws -> Data
}

class Webservice: WebserviceProtocol {
    
    enum Constants {
        static let volumesURL = "https://www.googleapis.com/books/v1/volumes"
    }
    
    enum Errors: Error {
        case malformedUrl
    }
    
    func retrieveBooks(query: String) async throws -> BookResponse {
        
        let string = Constants.volumesURL + "?q=\(query)"
        
        guard let url = URL(string: string) else {
            throw Errors.malformedUrl
        }
        
        return try await retrieve(from: url)
    }
    
    private func retrieve<T: Decodable>(from url: URL) async throws -> T {
        let request = URLRequest(url: url)
        let data = try await data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
    func data(for request: URLRequest) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
