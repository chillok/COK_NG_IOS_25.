//
//  AppContainer.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import SwiftUI

final class AppContainer: ObservableObject {
    
    let searchViewVM: SearchViewVM
    let searchCoordinator: SearchCoordinator

    init() {
        searchViewVM = SearchViewVM(webservice: Webservice())
        searchCoordinator = SearchCoordinator()
    }
}
