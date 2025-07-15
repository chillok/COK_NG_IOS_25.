//
//  SearchViewVM.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 14/07/2025.
//

import Foundation
import Combine

class SearchViewVM: ObservableObject {
    
    enum Constants {
        static let debounce: Int = 300
    }
    
    @Published var selectedBook: Book? = nil
    @Published var searchText: String = ""
    @Published var data: DataState<[Book]> = .ready
    
    private var cancellables = Set<AnyCancellable>()
    
    private var webservice: WebserviceProtocol
    
    required init(webservice: WebserviceProtocol) {
        self.webservice = webservice
        
        $searchText
            .debounce(for: .milliseconds(Constants.debounce), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.retrieveResults(for: text)
            }
            .store(in: &cancellables)
    }
    
    func search(for query: String) {
        searchText = query
    }
    
    private func retrieveResults(for query: String) {
        
        guard !query.isEmpty else {
            data = .ready
            return
        }
        
        data = .loading
        
        Task {
            
            do {
                let result = try await webservice.retrieveBooks(query: query)
                await MainActor.run {
                    data = .loaded(result.items)
                }
            } catch {
                await MainActor.run {
                    data = .failed
                }
            }
        }
    }
}
