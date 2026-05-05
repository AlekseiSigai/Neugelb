//
//  HomeFactory.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import NetworkService
import SwiftUI
import Router

final class HomeFactory {
    @MainActor
    static public func create() -> some View {
        let viewModel = HomeViewModel(networkService: NetworkService.shared,
                                      keychainManager: KeychainManager(),
                                      router: Router.shared)

        return HomeScreen(viewModel: viewModel)
    }
}
