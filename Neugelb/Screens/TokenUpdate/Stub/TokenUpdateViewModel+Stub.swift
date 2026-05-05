//
//  TokenUpdateViewModel+Stub.swift
//  Neugelb
//
//  Created by Aleksei Sigai on 04.05.26.
//

extension TokenUpdateViewModel {
    @MainActor
    struct Stub {
        static let viewModel = TokenUpdateViewModel(keychainManager: KeychainManager.Stub.Manager(),
                                                    router: TokenUpdateRoutingStub())
    }
}
