//
//  BooksDetailView.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 14/07/2025.
//

import SwiftUI

struct BooksDetailView: View {
    
    enum Constants {
        static let maxHeight: CGFloat = 200
    }
    
    let viewModel: BooksDetailViewVM
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    if let thumbnailURL = viewModel.book.volumeInfo.imageLinks?.thumbnail?.asSecureURL {
                        AsyncImage(url: thumbnailURL) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(height: Constants.maxHeight)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.gray.opacity(0.1))
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxHeight: Constants.maxHeight)
                                    .clipShape(.rect)
                            case .failure:
                                EmptyView()
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        
                        if let category = viewModel.book.volumeInfo.categories?.first {
                            Text(category.uppercased())
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(.background)
                                .padding(UIConstants.reducedPadding/2)
                                .background(Color.blue)
                                .clipShape(.rect(cornerRadius: 8))
                        }
                        
                        Text(viewModel.book.volumeInfo.title)
                            .font(.headline)
                        
                        if let authors = viewModel.book.volumeInfo.authors?.joined(separator: ", ") {
                            Text(authors)
                                .font(.subheadline)
                        }
                        
                        if let publishedDate = viewModel.book.volumeInfo.publishedDate?.extractYear() {
                            Text(publishedDate)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .frame(maxHeight: Constants.maxHeight)
                
                if let description = viewModel.book.volumeInfo.description {
                    Text(description)
                        .padding(.top, UIConstants.reducedPadding)
                }
            }
            .padding()
        }
    }
}

#if DEBUG

extension Book {
    static var sample: Book {
        .init(id: UUID().uuidString,
              volumeInfo: .init(title: "Nineteen eighty-four",
                                description: "This is a dystopian social science fiction novel and morality tale. The novel is set in the year 1984, a fictional future in which most of the world has been destroyed by unending war, constant government monitoring, historical revisionism, and propaganda. The totalitarian superstate Oceania, ruled by the Party and known as Airstrip One, now includes Great Britain as a province. The Party uses the Thought Police to repress individuality and critical thought. Big Brother, the tyrannical ruler of Oceania, enjoys a strong personality cult that was created by the party's overzealous brainwashing methods. Winston Smith, the main character, is a hard-working and skilled member of the Ministry of Truth's Outer Party who secretly despises the Party and harbors rebellious fantasies.",
                                authors: ["George Orwell"],
                                imageLinks: .init(thumbnail: "https://books.google.com/books/content?id=1L-jEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"),
                                pageCount: 66,
                                categories: ["fiction"],
                                publishedDate: "1968-02-07")
             )
    }
}

#endif

#Preview {
    BooksDetailView(viewModel:
            .init(book: Book.sample)
    )
}
