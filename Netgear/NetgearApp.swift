//
//  NetgearApp.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 14/07/2025.
//

import SwiftUI

@main
struct NetgearApp: App {
    
    @StateObject private var container = AppContainer()
    
    var body: some Scene {
        
        WindowGroup {
            SearchCoordinatorView(
                coordinator: container.searchCoordinator,
                viewModel: container.searchViewVM
            )
        }
    }
}
