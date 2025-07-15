//
//  SearchCoordinatorView.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 14/07/2025.
//

import Foundation
import SwiftUI

enum SearchRoutes: Hashable {
    case detail(Book)
}

struct SearchCoordinatorView: View {
    
    @ObservedObject private var coordinator: SearchCoordinator
    @ObservedObject private var viewModel: SearchViewVM
    
    init(
        coordinator: SearchCoordinator,
        viewModel: SearchViewVM
    ) {
        self.coordinator = coordinator
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            SearchView(viewModel: viewModel)
                .navigationDestination(for: SearchRoutes.self) { route in
                    switch route {
                    case .detail(let book):
                        BooksDetailView(viewModel: .init(book: book))
                    }
                }
        }
        .onAppear {
            coordinator.bind(to: viewModel)
        }
    }
}
