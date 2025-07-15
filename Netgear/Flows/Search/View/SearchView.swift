//
//  ContentView.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 14/07/2025.
//

import SwiftUI

struct SearchView: View {
    
    enum Constants {
        static let maxHeight: CGFloat = 300
        static let bottomPadding: CGFloat = 300
        static let cardCornerRadius: CGFloat = 12
        
        static let callout = "Search for information on your favourite books via the Google Books API"
        static let failedLoadMessage = "Failed to load results. Please try a different search term"
        static let noResults = "No results. Please try a different search term"
        static let title = "Google Books"
    }
    
    @ObservedObject var viewModel: SearchViewVM
    @State private var selectedPage = 0
    
    init(
        viewModel: SearchViewVM
    ) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                results(for: viewModel)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle(Constants.title)
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $viewModel.searchText,
                        placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: viewModel.searchText) { _, newValue in
                viewModel.search(for: newValue)
                
                if newValue.isEmpty {
                    selectedPage = 0
                }
            }
        }
        .onAppear() {
            UIPageControl.applyStyle()
        }
    }
    
    @ViewBuilder
    func results(for viewModel: SearchViewVM) -> some View {
        switch viewModel.data {
        case .ready:
            VStack {
                Text(Constants.callout)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .padding(UIConstants.reducedPadding)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(.rect(cornerRadius: Constants.cardCornerRadius))
                
                Spacer()
            }
            .padding(UIConstants.reducedPadding)
            
        case .loading:
            ProgressView()
            
        case .loaded(let books):
            if !books.isEmpty {
                TabView(selection: $selectedPage) {
                    ForEach(books.indices, id: \.self) { index in
                        let book = books[index]
                        BookCardView(book: book)
                            .frame(height: Constants.maxHeight)
                            .tag(index)
                            .onTapGesture {
                                self.viewModel.selectedBook = book
                            }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.bottom, Constants.bottomPadding)
            } else {
                Text(Constants.noResults)
            }
        case .failed:
            Text(Constants.failedLoadMessage)
        }
    }
}

#Preview {
    SearchView(viewModel: SearchViewVM(webservice: Webservice()))
}
