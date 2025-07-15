//
//  BooksDetailVM.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import Foundation

class BooksDetailViewVM: ObservableObject {
    
    let book: Book
    
    init(book: Book) {
        self.book = book
    }
}
