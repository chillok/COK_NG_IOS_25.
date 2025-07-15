//
//  SearchCoordinator.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import Foundation
import Combine

final class SearchCoordinator: ObservableObject {
    @Published var path: [SearchRoutes] = []
    
    private var cancellables = Set<AnyCancellable>()

    func bind(to viewModel: SearchViewVM) {
        viewModel.$selectedBook
            .compactMap { $0 }
            .sink { [weak self] book in
                DispatchQueue.main.async {
                    self?.path.append(.detail(book))
                    viewModel.selectedBook = nil
                }
            }
            .store(in: &cancellables)
    }
}
