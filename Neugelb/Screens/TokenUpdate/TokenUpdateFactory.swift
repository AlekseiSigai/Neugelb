//
//  TokenUpdateFactory.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

import SwiftUI
import Router

final class TokenUpdateFactory {
    @MainActor
    static public func create() -> some View {
        let viewModel = TokenUpdateViewModel(keychainManager: KeychainManager(),
                                             router: Router.shared)

        return TokenUpdateScreen(viewModel: viewModel)
    }
}
