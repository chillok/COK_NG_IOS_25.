//
//  BookCardView.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 14/07/2025.
//

import SwiftUI

struct BookCardView: View {
    
    enum Constants {
        static let commonViewMaxHeight: CGFloat = 180
        static let shadowRadius: CGFloat = 20
    }
    
    let book: Book

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            if let thumbnailURL = book.volumeInfo.imageLinks?.thumbnail?.asSecureURL {
                AsyncImage(url: thumbnailURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: Constants.commonViewMaxHeight)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.1))
                    case .success(let image):
                        image
                            .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(minHeight: 0,maxHeight: .infinity)
                                .aspectRatio(16/9, contentMode: .fit)
                                .clipShape(.rect)
                    case .failure:
                        bookView
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                bookView
            }

            Text(book.volumeInfo.title)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)
                .padding(.top, UIConstants.reducedPadding)

        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(UIConstants.cornerRadius)
        .shadow(color: .black.opacity(0.1), radius: Constants.shadowRadius)
        .padding(UIConstants.reducedPadding)
    }
    
    @ViewBuilder
    var bookView: some View {
        Image(systemName: "book")
            .resizable()
            .scaledToFit()
            .padding()
            .frame(height: Constants.commonViewMaxHeight)
            .frame(maxWidth: .infinity)
            .foregroundColor(.gray)
    }
}

#Preview {
    BookCardView(book: .sample)
}
