//
//  SettingsFactory.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import SwiftUI
import Router

final class SettingsFactory {
    @MainActor
    static public func create() -> some View {
        let viewModel = SettingsViewModel(keychainManager: KeychainManager(),
                                          router: Router.shared)

        return SettingsScreen(viewModel: viewModel)
    }
}
