//
//  DataState.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 14/07/2025.
//

import Foundation

// DataState is useful for enforcing consistent data loading for SwiftUI
enum DataState<T> {
    case ready
    case loading
    case loaded(T)
    case failed
}
